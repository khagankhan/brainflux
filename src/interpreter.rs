use crate::optimize::*;
use crate::implementation::*;
use crate::cli::*;
use crate::profiler::*;
use std::io::Read;
pub struct Interpreter {}
impl Interpreter {
    /// The interpreter that runs the provided tokens
    pub fn interpret(interpreter: &mut Implementation, tokens: &mut Vec<TokenType>, print_profiler: bool,  optimize: bool) -> BrainFluxError<()> {
        let mut loop_stack = Vec::with_capacity(16);
        let mut profiler = Profiler::with_tokens(tokens);
        let mut n = 0;
        while n < 5 {
            profiler.loop_profiling(tokens);
            Optimize::pre_process_optimize(tokens, optimize)?;
            n += 1;
        }
        while interpreter.pp < tokens.len() {
            let ttype = &tokens[interpreter.pp];
            profiler.count_executions(interpreter.pp, print_profiler);
            match ttype {
                TokenType::IncrementPointer => {
                    interpreter.dp = interpreter.dp.wrapping_add(1);
                },
                TokenType::DecrementPointer => {
                    interpreter.dp = interpreter.dp.wrapping_sub(1);
                },
                TokenType::IncrementValue => {
                    interpreter.dt[interpreter.dp] = interpreter.dt[interpreter.dp].wrapping_add(1);
                },
                TokenType::DecrementValue => {
                    interpreter.dt[interpreter.dp] = interpreter.dt[interpreter.dp].wrapping_sub(1);
                },
                TokenType::StdOut => {
                    print!("{}", (interpreter.dt[interpreter.dp]) as char);
                },
                TokenType::StdIn => {
                    let mut input = [0u8];
                    std::io::stdin().read_exact(&mut input)?;
                    interpreter.dt[interpreter.dp] = input[0];
                },
                TokenType::LoopStart => {
                    if interpreter.dt[interpreter.dp] == 0 { 
                        let mut loop_level = 1;
                        while loop_level > 0 {
                            interpreter.pp += 1;
                            match &tokens[interpreter.pp] {
                                TokenType::LoopStart => {
                                    loop_level += 1;
                                }
                                TokenType::LoopEnd => {
                                    loop_level -= 1;
                                },
                                _ => {},
                            }
                        }
                    } else {
                        loop_stack.push(interpreter.pp); 
                    }
                },
                TokenType::LoopEnd => {
                    if interpreter.dt[interpreter.dp] != 0 {
                        if let Some(loop_start) = loop_stack.last() { 
                            interpreter.pp = *loop_start;
                        }
                    } else {
                        let _pp = loop_stack.pop(); 
                    }
                },
                TokenType::ZeroCell => {
                    interpreter.dt[interpreter.dp] = 0;
                },
                TokenType::IncrementValueN(n) => {
                    interpreter.dt[interpreter.dp] += *n as u8;
                },
                TokenType::DecrementValueN(n) => {
                    interpreter.dt[interpreter.dp] -= *n as u8;
                },
                TokenType::IncrementPointerN(n) => {
                    interpreter.dp = interpreter.dp.wrapping_add(n.clone() as usize);
                },
                TokenType::DecrementPointerN(n) => {
                    interpreter.dp = interpreter.dp.wrapping_sub(n.clone() as usize);
                },
                _ => {},
            }
            interpreter.pp += 1;
        }
        profiler.print_profile(print_profiler, optimize);
        //profiler.update_tokens(tokens);
        //profiler.loop_profiling(tokens);
        //profiler.print_profile(print_profiler, optimize);

        Ok(())
    }
}