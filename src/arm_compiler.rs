use crate::implementation::*;
use crate::cli::*;
use crate::optimize::*;
use crate::profiler::Profiler;
use std::fs::File;
use std::io::Write;

pub struct ArmCompiler;

impl ArmCompiler {
    pub fn arm_compiler(tokens: &mut Vec<TokenType>, print_profiler: bool, optimize: bool) -> BrainFluxError<()> {
        let mut profiler = Profiler::with_tokens(tokens);
        profiler.loop_profiling(tokens);
        profiler.print_profile(print_profiler, &tokens)?;
        Optimize::basic_optimization(tokens, optimize, &profiler)?;
        Optimize::simple_loop(tokens, optimize, &profiler)?;        
        Optimize::memory_scan(tokens, optimize, &profiler)?;
        profiler.loop_profiling(tokens);
        profiler.print_profile(print_profiler, &tokens)?;
        // Prologue
        let mut assembly = String::from(
            "\t.text\n\
            \t.p2align 2\n\
            \t.global _main\n\
            \t.extern _putchar, _getchar, _malloc, _free, _memset\n\
            _main:\n\
            \tstp x29, x30, [sp, #-16]!\n\
            \tmov x29, sp\n\
            \tstp x19, x20, [sp, #-16]!\n\
            \tmov x0, #30000\n\
            \tbl _malloc\n\
            \tmov x19, x0\n\
            \tmov x20, x0\n\
            \tmov x1, x19\n\
            \tmov w2, #0\n\
            \tmov x3, #30000\n\
            \tbl _memset\n\
            "
        );
        let mut loop_counter = 0;
        let mut loop_stack = Vec::with_capacity(64);
        let mut label_counter = 0;
        for (_, token)in tokens.iter().enumerate() {
            match token {
                TokenType::IncrementPointer => {
                    assembly.push_str("    add x19, x19, #1\n");
                },
                TokenType::DecrementPointer => {
                    assembly.push_str("    sub x19, x19, #1\n");
                },
                TokenType::IncrementValue => {
                    assembly.push_str("    ldrb w1, [x19]\n");
                    assembly.push_str("    add w1, w1, #1\n");
                    assembly.push_str("    strb w1, [x19]\n");
                },
                TokenType::DecrementValue => {
                    assembly.push_str("    ldrb w1, [x19]\n");
                    assembly.push_str("    sub w1, w1, #1\n");
                    assembly.push_str("    strb w1, [x19]\n");
                },
                TokenType::StdOut => {
                    assembly.push_str("    ldrb w0, [x19]\n");
                    assembly.push_str("    bl _putchar\n");
                },
                TokenType::StdIn => {
                    assembly.push_str("    bl _getchar\n");
                    assembly.push_str("    strb w0, [x19]\n");
                },
                TokenType::LoopStart => {
                    let loop_start_label = format!("loop_start_{}", loop_counter);
                    let loop_end_label = format!("loop_end_{}", loop_counter);
                    assembly.push_str(&format!("{}:\n", loop_start_label));
                    assembly.push_str("    ldrb w1, [x19]\n");
                    assembly.push_str(&format!("    cbz w1, {}\n", loop_end_label));
                    loop_stack.push((loop_start_label, loop_end_label));
                    loop_counter += 1;
                },
                TokenType::LoopEnd => {
                    if let Some((loop_start_label, loop_end_label)) = loop_stack.pop() {
                        assembly.push_str("    ldrb w1, [x19]\n");
                        assembly.push_str(&format!("    cbnz w1, {}\n", loop_start_label));
                        assembly.push_str(&format!("{}:\n", loop_end_label));
                    }
                },
                // Optimizations
                TokenType::IncrementValueN(n) => {
                    assembly.push_str("    ldrb w1, [x19]\n");
                    assembly.push_str(&format!("    add w1, w1, #{}\n", n));
                    assembly.push_str("    strb w1, [x19]\n");
                },
                TokenType::DecrementValueN(n) => {
                    assembly.push_str("    ldrb w1, [x19]\n");
                    assembly.push_str(&format!("    sub w1, w1, #{}\n", n));
                    assembly.push_str("    strb w1, [x19]\n");
                },
                TokenType::IncrementPointerN(n) => {
                    if *n > 4095 {
                        assembly.push_str(&format!("    mov x8, #{}\n", n)); // Load the large immediate into a temporary register
                        assembly.push_str("    add x19, x19, x8\n");        // Add using the register
                    } else {
                        assembly.push_str(&format!("    add x19, x19, #{}\n", n)); // Use immediate if it's within range
                    }
                },
                TokenType::DecrementPointerN(n) => {
                    if *n > 4095 {
                        assembly.push_str(&format!("    mov x8, #{}\n", n)); // Load the large immediate into a temporary register
                        assembly.push_str("    sub x19, x19, x8\n");        // Subtract using the register
                    } else {
                        assembly.push_str(&format!("    sub x19, x19, #{}\n", n)); // Use immediate if it's within range
                    }
                },
                TokenType::ZeroAndModify(modifications) => {
                    let mut my_modifications = modifications.clone();
                    my_modifications.sort_by(|a, b| {
                        // First, sort by p
                        a.2.cmp(&b.2)
                            // Then by absolute value of n
                            .then_with(|| a.0.abs().cmp(&b.0.abs()))
                            // Finally, put n == 0 first for the same p and absolute value of n
                            .then_with(|| a.0.cmp(&b.0))
                    });
                    println!("Modifications: {:?}", my_modifications);
                                        // First, handle zeroing cases for current memory cell
                    if let Some((_, m, _)) = my_modifications.iter().find(|(n, _, p)| *n == 0 && *p == 0) {
                        assembly.push_str("    ldrb w1, [x19]\n");  // Load current memory cell into w1
                        match *m {
                            -1 => {
                                // Handle [-] zeroing case
                                assembly.push_str("    strb wzr, [x19]\n");  // Store zero in current cell
                            },
                            1 => {
                                // Handle [+] zeroing case (overflow)
                                assembly.push_str("    mov w2, #256\n");     // Load 256 into w2
                                assembly.push_str("    sub w1, w2, w1\n");   // w1 = 256 - w1
                                assembly.push_str("    strb wzr, [x19]\n");  // Store zero in current cell
                            },
                            _ => unreachable!("[-] Error: Simple loops should change the current cell either by +1 or -1 each iteration")
                        }
                    }
                    for (n, m,p) in my_modifications.iter().filter(|(_, _, p)| *p != 0) {
                        let cell_offset_from_inner_loop = *n;
                        let value_in_inner_loop = *m;
                        let inner_loop_offset_from_outer_loop = *p;
                        let cell_offset_from_outer_loop = inner_loop_offset_from_outer_loop + cell_offset_from_inner_loop;          
                        // Load the value of the inner loop beginning
                        if *n == 0 {
                            assembly.push_str(&format!("    ldrb w3, [x19, #{}]\n", inner_loop_offset_from_outer_loop));    
                            match value_in_inner_loop {
                                -1 => {
                                    assembly.push_str(&format!("    strb wzr, [x19, #{}]\n", inner_loop_offset_from_outer_loop));
                                },
                                1 => {
                                    // Handle [+] zeroing case (overflow)
                                    assembly.push_str("    mov w2, #256\n");     // Load 256 into w2
                                    assembly.push_str("    sub w3, w2, w3\n");   // w1 = 256 - w1
                                    assembly.push_str(&format!("    strb wzr, [x19, #{}]\n", inner_loop_offset_from_outer_loop));
                                },
                                _ => unreachable!("[-] Error: expected -1 or +1 in the simple loop got: {}", value_in_inner_loop)

                            }
                            continue;
                        }
                        assembly.push_str(&format!("    ldrb w2, [x19, #{}]\n", cell_offset_from_outer_loop));  // Load memory at offset n into w2
                        assembly.push_str("     mul w4, w1, w3\n");   
                        match value_in_inner_loop {
                            1 => assembly.push_str("    add w2, w2, w4\n"),  // Direct addition: w2 += w1
                            -1 => assembly.push_str("    sub w2, w2, w4\n"), // Direct subtraction: w2 -= w1
                            m if m > 0 => {
                                // Multiplication and addition: w2 = (w1 * m) + w2
                                assembly.push_str(&format!("    mov w5, #{}\n", m));  
                                assembly.push_str("    madd w2, w4, w5, w2\n");
                            },
                            m if m < 0 => {
                                // Multiplication and subtraction: w2 = w2 - (w1 * abs(m))
                                assembly.push_str(&format!("    mov w5, #{}\n", -m));  
                                assembly.push_str("    msub w2, w4, w5, w2\n");
                            },
                            _ => {}
                        }
                        assembly.push_str(&format!("    strb w2, [x19, #{}]\n", cell_offset_from_outer_loop));  // Store back to memory
                    }
                    // Then, handle the modification of other memory cells
                    for (n, m,_) in my_modifications.iter().filter(|(_, _, p)| *p == 0) {
                        if *n == 0 {
                            continue;
                        }
                        assembly.push_str(&format!("    ldrb w2, [x19, #{}]\n", n));  // Load memory at offset n into w2
                        match *m {
                            1 => assembly.push_str("    add w2, w2, w1\n"),  // Direct addition: w2 += w1
                            -1 => assembly.push_str("    sub w2, w2, w1\n"), // Direct subtraction: w2 -= w1
                            m if m > 0 => {
                                // Multiplication and addition: w2 = (w1 * m) + w2
                                assembly.push_str(&format!("    mov w5, #{}\n", m));  
                                assembly.push_str("    madd w2, w1, w5, w2\n");
                            },
                            m if m < 0 => {
                                // Multiplication and subtraction: w2 = w2 - (w1 * abs(m))
                                assembly.push_str(&format!("    mov w5, #{}\n", -m));  
                                assembly.push_str("    msub w2, w1, w5, w2\n");
                            },
                            _ => {}
                        }
                        assembly.push_str(&format!("    strb w2, [x19, #{}]\n", n));  // Store back to memory
                    }
                },   
                TokenType::MemoryScan(n) => { 
                    let loop_label = format!("loop_memory_scan{}", label_counter);
                    label_counter += 1;
                    // After the zeros in different indexes are found the following ands
                    // keep only the ones in the exact posiitions we want so rbit+clz find
                    // only the ones in the positions we want.
                    let constant = match *n {
                        // [>]: if reegister is zero (not found (no xf)) jump back.
                        1 => &format!("    cbz x8, {}\n", loop_label), 
                        // For [>>] since it moves pointer two times, keep the ones in even position: 0, 2, 4 ... 
                        2 => "    ands x8, x8, #0x0f0f0f0f0f0f0f0f\n",
                        // For [>>>>] since it moves pointer four times, keep the ones in the positions divible by 4: 0, 4, 8, 12 
                        4 => "    ands x8, x8, #0x000f000f000f000f\n",
                        // The above logic is the same for [>>>>>>>>] as well. Not sure if it make it faster for 8. 
                        8 => "    ands x8, x8, #0x0000000f0000000f\n",  
                        _ => unreachable!("[-] Error: Pointer incrementation should be a power of 2"),
                    };
                    // Apply the finding the first matching logic
                    assembly.push_str(&format!("{}:\n", loop_label));  
                    assembly.push_str("    ld1.16b {v0}, [x19], #16\n");  
                    assembly.push_str("    cmeq.16b v0, v0, #0\n");        
                    assembly.push_str("    shrn.8b v0, v0, #4\n");
                    assembly.push_str("    fmov x8, d0\n");  
                    assembly.push_str(constant);  
                    if *n != 1 {
                        // If zero flag is set, it means ands found no matching 0s in the desires position
                        // So we simply jump to the loop again
                        assembly.push_str(&format!("    b.eq {}\n", loop_label));
                    }  
                    // Since we do not have ctz in ARM we use rbit + clz instead
                    assembly.push_str("    rbit x9, x8\n");  
                    assembly.push_str("    clz x9, x9\n");  
                    // We have additional post increment +16. So we must decrement that firstly
                    assembly.push_str("    sub x19, x19, #16\n");  
                    // Divide by four and increment the pointer
                    assembly.push_str("    add x19, x19, x9, lsr #2\n"); 
                },                                                 
                TokenType::Nop => {},
            }
        }
        // Epilogue
        assembly.push_str(
            "\
            \tmov x0, x20\n\
            \tbl _free\n\
            \tldp x19, x20, [sp], #16\n\
            \tldp x29, x30, [sp], #16\n\
            \tmov w0, #0\n\
            \tret\n\
            "
        );
        let mut file = File::create("output.s")?;
        file.write_all(assembly.as_bytes())?;
        Ok(())
    }
}