use crate::implementation::*;
use crate::cli::*;
use crate::optimize::*;
use crate::profiler::Profiler;
use std::fs::File;
use std::io::Write;

pub struct ArmCompiler;

impl ArmCompiler {
    pub fn arm_compiler(tokens: &mut Vec<TokenType>, optimize: bool) -> BrainFluxError<()> {
        let mut profiler = Profiler::with_tokens(tokens);
        let mut n = 0;
        while n < 1 {
            profiler.loop_profiling(tokens);
            Optimize::phase1(tokens, optimize, &profiler)?;
            n += 1;
        }
        profiler.print_profile(true, &tokens)?;
        profiler.loop_profiling(tokens);
        profiler.print_profile(true, &tokens)?;
        let mut assembly = String::from(
            "\t.text\n\
            \t.align 2\n\
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
            \teor w2, w2, w2\n\
            \tmov x3, #30000\n\
            \tbl _memset\n\
            "
        );
        let mut loop_counter = 0;
        let mut loop_stack = Vec::with_capacity(64);

        for (index, token)in tokens.iter().enumerate() {
            profiler.count_executions(index, true);
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
                    assembly.push_str(&format!("    {}:\n", loop_start_label));
                    assembly.push_str("    ldrb w1, [x19]\n");
                    assembly.push_str(&format!("    cbz w1, {}\n", loop_end_label));
                    loop_stack.push((loop_start_label, loop_end_label));
                    loop_counter += 1;
                },
                TokenType::LoopEnd => {
                    if let Some((loop_start_label, loop_end_label)) = loop_stack.pop() {
                        assembly.push_str("    ldrb w1, [x19]\n");
                        assembly.push_str(&format!("    cbnz w1, {}\n", loop_start_label));
                        assembly.push_str(&format!("    {}:\n", loop_end_label));
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
                        assembly.push_str(&format!("    mov x0, #{}\n", n)); // Load the large immediate into a temporary register
                        assembly.push_str("    add x19, x19, x0\n");        // Add using the register
                    } else {
                        assembly.push_str(&format!("    add x19, x19, #{}\n", n)); // Use immediate if it's within range
                    }
                },
                TokenType::DecrementPointerN(n) => {
                    if *n > 4095 {
                        assembly.push_str(&format!("    mov x0, #{}\n", n)); // Load the large immediate into a temporary register
                        assembly.push_str("    sub x19, x19, x0\n");        // Subtract using the register
                    } else {
                        assembly.push_str(&format!("    sub x19, x19, #{}\n", n)); // Use immediate if it's within range
                    }
                },
                
                TokenType::ZeroAndModify(modifications) => {
                    assembly.push_str("    ldrb w1, [x19]\n");
                    assembly.push_str("    eor w2, w2, w2\n");  
                    assembly.push_str("    strb w2, [x19]\n");

                    for i in 0..modifications.len() {
                        let n = modifications[i].0;
                        let m = modifications[i].1;
                        if n == 0 {
                            continue;
                        }
                        assembly.push_str(&format!("    ldrb w2, [x19, #{}]\n", n));  // Load with offset
                        if m == 1 {
                            // Direct addition: w2 += w1
                            assembly.push_str("    add w2, w2, w1\n");  // w2 = w2 + w1
                        } else if m == -1 {
                            // Direct subtraction: w2 -= w1
                            assembly.push_str("    sub w2, w2, w1\n");  // w2 = w2 - w1
                        } else if m > 1 {
                            assembly.push_str(&format!("    mov w3, #{}\n", m));  // Move multiplier m into w3
                            assembly.push_str("    madd w2, w1, w3, w2\n");  // w2 = (w1 * w3) + w2
    
                        } else if m < -1 {
                            assembly.push_str(&format!("    mov w3, #{}\n", -m));  // Move negative multiplier -m into w3
                            assembly.push_str("    msub w2, w1, w3, w2\n");  // w2 = (w1 * w3) - w2
                        }
                        assembly.push_str(&format!("    strb w2, [x19, #{}]\n", n)); // Store back with offset
                    }
                },                     
                TokenType::Nop => {},
            }
        }
        // Epilogue
        assembly.push_str(
            "\
            mov x0, x20\n\
            bl _free\n\
            ldp x19, x20, [sp], #16\n\
            ldp x29, x30, [sp], #16\n\
            eor w0, w0, w0\n\
            ret\n\
            "
        );
        let mut file = File::create("output.s")?;
        file.write_all(assembly.as_bytes())?;
        Ok(())
    }
}