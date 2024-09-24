use crate::implementation::*;
use crate::cli::*;
use crate::optimize::*;
use std::fs::File;
use std::io::Write;
pub struct ArmCompiler;

impl ArmCompiler {
    pub fn arm_compiler(tokens: &mut Vec<TokenType>, optimize: bool) -> BrainFluxError<()> {

        Optimize::pre_process_optimize(tokens, optimize)?;
        
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

        for token in tokens.iter() {
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
                TokenType::ZeroCell => {
                    assembly.push_str("    ldrb w1, [x19]\n");
                    assembly.push_str("    eor w1, w1, w1\n");
                    assembly.push_str("    strb w1, [x19]\n");
                },
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
                _=> {},
            }
        }
        // Epilogue
        assembly.push_str(
            "\
            mov x0, x20\n\
            bl _free\n\
            ldp x19, x20, [sp], #16\n\
            ldp x29, x30, [sp], #16\n\
            ret\n\
            eor w0, w0, w0\n\
            ret\n\
            "
        );
        if optimize {
            Self::post_process_optimize(&mut assembly);
        }
        let mut file = File::create("output.s")?;
        file.write_all(assembly.as_bytes())?;
        Ok(())
    }
    fn post_process_optimize(assembly: &mut String) {
       Self::sum_pointer_changes(assembly);
    }    
    fn sum_pointer_changes(assembly: &mut String) {
        let mut optimized_assembly = String::new();
        let mut lines = assembly.lines();
        let mut pointer_increment: i32 = 0;
   
        while let Some(line) = lines.next() {
            if line.contains("add x19, x19, #1") {
                pointer_increment += 1;
                continue;
            } else if line.contains("sub x19, x19, #1") {
                pointer_increment -= 1;
                continue;
            }
            if pointer_increment != 0 {
                if pointer_increment > 0 {
                    optimized_assembly.push_str(&format!("    add x19, x19, #{}\n", pointer_increment));
                } else {
                    optimized_assembly.push_str(&format!("    sub x19, x19, #{}\n", pointer_increment.abs()));
                }
                pointer_increment = 0;
            }
            optimized_assembly.push_str(line);
            optimized_assembly.push('\n');
        }
        if pointer_increment != 0 {
            if pointer_increment > 0 {
                optimized_assembly.push_str(&format!("    add x19, x19, #{}\n", pointer_increment));
            } else {
                optimized_assembly.push_str(&format!("    sub x19, x19, #{}\n", pointer_increment.abs()));
            }
        }
        *assembly = optimized_assembly;
    }    
}