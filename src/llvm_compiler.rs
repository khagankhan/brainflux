use crate::implementation::*;
use crate::cli::*;
use crate::optimize::*;
use crate::profiler::Profiler;
use inkwell::context::Context;
use inkwell::module::Linkage;
use inkwell::AddressSpace;

pub struct LLVMCompiler;

impl LLVMCompiler {
    pub fn llvm_compiler(tokens: &mut Vec<TokenType>, print_profiler: bool, optimize: bool) -> BrainFluxError<()> {
        let mut profiler = Profiler::with_tokens(tokens);
        profiler.loop_profiling(tokens);
        profiler.print_profile(print_profiler, &tokens)?;
        Optimize::basic_optimization(tokens, optimize, &profiler)?;
        //Optimize::simple_loop(tokens, optimize, &profiler)?; TODO: ZeroAndModify simple loop for LLVM        
        profiler.print_profile(print_profiler, &tokens)?;
        let context = Context::create();
        let module = context.create_module("brainfuck_module");
        let builder = context.create_builder();
        // Create main function
        let i32_type = context.i32_type();
        let main_fn_type = i32_type.fn_type(&[], false);
        let main_fn = module.add_function("main", main_fn_type, Some(Linkage::External));
        let entry = context.append_basic_block(main_fn, "entry");
        builder.position_at_end(entry);
        // Allocate tape memory
        let i8_type = context.i8_type();
        let tape_type = i8_type.array_type(30000);
        let tape = builder.build_alloca(tape_type, "tape")?;
        builder.build_memset(
            tape, 
            1, // Alignment in bytes
            i8_type.const_int(0, false), // Value to set (0)
            i32_type.const_int(30000, false), // Size as IntValue
        )?;   
        // Create pointer to tape (initially pointing to tape[0])
        let tape_ptr_type = i8_type.ptr_type(AddressSpace::from(0));
        let tape_ptr = builder.build_alloca(tape_ptr_type, "tape_ptr")?;
        let start_ptr = unsafe {
            builder.build_in_bounds_gep(tape_type, tape, &[i32_type.const_zero(), i32_type.const_zero()], "start_ptr")
        }?;
        builder.build_store(tape_ptr, start_ptr)?;
        // Declare putchar unlike getchar
        let putchar_type = i32_type.fn_type(&[i32_type.into()], false);
        module.add_function("putchar", putchar_type, None);
        // Loop stack to handle nested loops
        let mut loop_stack = Vec::new();
        // Process tokens and generate corresponding LLVM IR
        for token in tokens.iter() {
            match token {
                TokenType::IncrementPointer => {
                    // Specify the type explicitly for `build_load`
                    let ptr = builder.build_load(tape_ptr_type, tape_ptr, "ptr")?.into_pointer_value();
                    // Provide correct arguments for `build_in_bounds_gep`
                    let new_ptr = unsafe { 
                        builder.build_in_bounds_gep(i8_type, ptr, &[i32_type.const_int(1, false)], "ptr_inc") 
                    }?;
                    // Store the new pointer back to `tape_ptr`
                    builder.build_store(tape_ptr, new_ptr)?;
                },
                TokenType::DecrementPointer => {
                    // Specify the type for `build_load`
                    let ptr = builder.build_load(tape_ptr_type, tape_ptr, "ptr")?.into_pointer_value();
                    // Use `const_int(1, false)` to get a positive integer, then use GEP for subtraction
                    let new_ptr = unsafe { 
                        builder.build_in_bounds_gep(i8_type, ptr, &[i32_type.const_int(-1i64 as u64, false)], "ptr_dec") 
                    }?;
                    // Store the decremented pointer back to `tape_ptr`
                    builder.build_store(tape_ptr, new_ptr)?;
                },                
                TokenType::IncrementValue => {
                    // Specify the type for `build_load` when loading `tape_ptr`
                    let ptr = builder.build_load(tape_ptr_type, tape_ptr, "ptr")?.into_pointer_value();
                    // Load the current value at `ptr` (pointer to `i8`)
                    let val = builder.build_load(i8_type, ptr, "val")?.into_int_value();
                    // Increment the loaded value by 1
                    let inc = builder.build_int_add(val, i8_type.const_int(1, false), "inc")?;
                    // Store the incremented value back at `ptr`
                    builder.build_store(ptr, inc)?;
                },
                TokenType::DecrementValue => {
                    // Load the pointer from `tape_ptr`
                    let ptr = builder.build_load(tape_ptr_type, tape_ptr, "ptr")?.into_pointer_value();
                    // Load the current value at `ptr` (an `i8` value)
                    let val = builder.build_load(i8_type, ptr, "val")?.into_int_value();
                    // Decrement the value by 1
                    let dec = builder.build_int_sub(val, i8_type.const_int(1, false), "dec")?;
                    // Store the decremented value back to `ptr`
                    builder.build_store(ptr, dec)?;
                },
                TokenType::StdOut => {
                    // Retrieve the `putchar` function from the module
                    let putchar_func = module.get_function("putchar").expect("putchar function not defined");
                    // Load the pointer from `tape_ptr`
                    let ptr = builder.build_load(tape_ptr_type, tape_ptr, "ptr")?.into_pointer_value();
                    // Load the current value at `ptr` (an `i8` value)
                    let val = builder.build_load(i8_type, ptr, "val")?.into_int_value();
                    // Extend `val` from `i8` to `i32` for the `putchar` function
                    let val_int32 = builder.build_int_z_extend(val, i32_type, "val_int32")?;
                    // Call `putchar` with `val_int32` as an argument
                    builder.build_call(putchar_func, &[val_int32.into()], "putchar_call")?;
                },                
                TokenType::StdIn => {
                    // Define `getchar` as an external function if not already defined
                    // For putchar it is defined above. TODO: Choose one of these and keep
                    let getchar_func = module.get_function("getchar").unwrap_or_else(|| {
                        let getchar_type = i32_type.fn_type(&[], false);
                        module.add_function("getchar", getchar_type, None)
                    });
                    // Call `getchar` and retrieve the result
                    let ch = builder.build_call(getchar_func, &[], "getchar_call")?
                                    .try_as_basic_value().left().unwrap().into_int_value();
                    // Truncate the `i32` result from `getchar` to `i8`
                    let ch_int8 = builder.build_int_truncate(ch, i8_type, "ch_int8")?;
                    // Load the pointer from `tape_ptr`
                    let ptr = builder.build_load(tape_ptr_type, tape_ptr, "ptr")?.into_pointer_value();
                    // Store the truncated `ch_int8` value to `ptr`
                    builder.build_store(ptr, ch_int8)?;
                },                              
                TokenType::LoopStart => {
                    // Get the current function and create the basic blocks for the loop
                    let function = builder.get_insert_block().unwrap().get_parent().unwrap();
                    let loop_cond = context.append_basic_block(function, "loop_cond");
                    let loop_body = context.append_basic_block(function, "loop_body");
                    let loop_end = context.append_basic_block(function, "loop_end");
                    // Unconditional branch to the loop condition check
                    builder.build_unconditional_branch(loop_cond)?;
                    builder.position_at_end(loop_cond);
                    // Load the pinter from `tape_ptr`
                    let ptr = builder.build_load(tape_ptr_type, tape_ptr, "ptr")?.into_pointer_value();
                    // Load the current value at `ptr` (an `i8` value)
                    let val = builder.build_load(i8_type, ptr, "val")?.into_int_value();
                    // Compare the value to 0 to set up the loop condition
                    let cond = builder.build_int_compare(inkwell::IntPredicate::NE, val, i8_type.const_int(0, false), "loop_cond")?;
                    // Conditional branch based on `cond` to either `loop_body` or `loop_end`
                    builder.build_conditional_branch(cond, loop_body, loop_end)?;
                    builder.position_at_end(loop_body);
                    // Push the loop conditin and end blocks onto the stack for later use in `LoopEnd`
                    loop_stack.push((loop_cond, loop_end));
                },
                TokenType::LoopEnd => {
                    // Pop the loop condition and end blocks from the stack
                    if let Some((loop_cond, loop_end)) = loop_stack.pop() {
                        // Branch back to the loop condition to evaluate again
                        builder.build_unconditional_branch(loop_cond)?;
                        // Position the builder at the loop end block for further code
                        builder.position_at_end(loop_end);
                    }
                },
                TokenType::IncrementValueN(n) => {
                    // Load the pointer from `tape_ptr`
                    let ptr = builder.build_load(tape_ptr_type, tape_ptr, "ptr")?.into_pointer_value();
                    // Load the current value at `ptr` (an `i8` value)
                    let val = builder.build_load(i8_type, ptr, "val")?.into_int_value();
                    // Increment the value by `n`
                    let inc = builder.build_int_add(val, i8_type.const_int(*n as u64, false), "inc")?;
                    // Store the incremented value back to `ptr`
                    builder.build_store(ptr, inc)?;
                },
                TokenType::DecrementValueN(n) => {
                    // Load the pointer from `tape_ptr`
                    let ptr = builder.build_load(tape_ptr_type, tape_ptr, "ptr")?.into_pointer_value();
                    // Load the current value at `ptr` (an `i8` value)
                    let val = builder.build_load(i8_type, ptr, "val")?.into_int_value();
                    // Decrement the value by `n`
                    let dec = builder.build_int_sub(val, i8_type.const_int(*n as u64, false), "dec")?;
                    // Store the decremented value back to `ptr`
                    builder.build_store(ptr, dec)?;
                },
                TokenType::IncrementPointerN(n) => {
                    // Load the pointer from `tape_ptr`
                    let ptr = builder.build_load(tape_ptr_type, tape_ptr, "ptr")?.into_pointer_value();
                    // Increment the pointer by `n`
                    let new_ptr = unsafe { 
                        builder.build_in_bounds_gep(i8_type, ptr, &[i32_type.const_int(*n as u64, false)], "ptr_inc") 
                    }?;
                    // Store the incremented pointer back to `tape_ptr`
                    builder.build_store(tape_ptr, new_ptr)?;
                },
                TokenType::DecrementPointerN(n) => {
                    // Load the pointer from `tape_ptr`
                    let ptr = builder.build_load(tape_ptr_type, tape_ptr, "ptr")?.into_pointer_value();
                    // Decrement the pointer by `n`
                    let new_ptr = unsafe { 
                        builder.build_in_bounds_gep(i8_type, ptr, &[i32_type.const_int(-(*n as i64) as u64, false)], "ptr_dec") 
                    }?;
                    // Store the decremented pointer back to `tape_ptr`
                    builder.build_store(tape_ptr, new_ptr)?;
                },    
                // TODO: MemoryScan for LLVM            
                _ => {},
            }
        }
        // Return 0 at the end of main function
        builder.build_return(Some(&i32_type.const_zero()))?;
        let target_triple = inkwell::targets::TargetTriple::create("arm64-apple-macosx13.0.0");
        module.set_triple(&target_triple);
        // Write the LLVM IR to a file
        // Verify the module
        if module.verify().is_err() {
            eprintln!("[-] Error: Module verification failed. Report!");
            std::process::exit(-1);
        } else {
            // TODO: Directly create object in the source
            module.print_to_file("output.ll")?;
        }
        Ok(())
    }
}