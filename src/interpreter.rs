use crate::implementation::*;
use crate::cli::*;
use crate::optimization::*;
use crate::profile_if;
use std::io::Read;
pub struct Interpreter {}
impl Interpreter {
    /// The interpreter that runs the provided tokens
    pub fn interpret(interpreter: &mut Implementation, tokens: &Vec<TokenType>, print_profiler: bool) -> BrainFluxError<()> {
        let mut loop_stack = Vec::with_capacity(16);
        let mut count_vector: Vec<(char, u32)> = vec![('*', 0); tokens.len()];
        let mut simple_loop_index = vec![0;4];
        while interpreter.pp < tokens.len() {
            match tokens[interpreter.pp] {
                TokenType::IncrementPointer => {
                    interpreter.dp = interpreter.dp.wrapping_add(1);
                    profile_if!(print_profiler, count_vector, interpreter, tokens);
                },
                TokenType::DecrementPointer => {
                    interpreter.dp = interpreter.dp.wrapping_sub(1);
                    profile_if!(print_profiler, count_vector, interpreter, tokens);
                },
                TokenType::IncrementValue => {
                    interpreter.dt[interpreter.dp] = interpreter.dt[interpreter.dp].wrapping_add(1);
                    profile_if!(print_profiler, count_vector, interpreter, tokens);
                },
                TokenType::DecrementValue => {
                    interpreter.dt[interpreter.dp] = interpreter.dt[interpreter.dp].wrapping_sub(1);
                    profile_if!(print_profiler, count_vector, interpreter, tokens);
                },
                TokenType::StdOut => {
                    print!("{}", (interpreter.dt[interpreter.dp]) as char);
                    profile_if!(print_profiler, count_vector, interpreter, tokens);
                },
                TokenType::StdIn => {
                    let mut input = [0u8];
                    std::io::stdin().read_exact(&mut input)?;
                    interpreter.dt[interpreter.dp] = input[0];
                },
                TokenType::LoopStart => {
                    profile_if!(print_profiler, count_vector, interpreter, tokens);
                    if interpreter.dt[interpreter.dp] == 0 { //++++[>+++++-<] 4 * 5 = 20
                        let mut loop_level = 1;
                        while loop_level > 0 {
                            interpreter.pp += 1;
                            match tokens[interpreter.pp] {
                                TokenType::LoopStart => loop_level += 1,
                                TokenType::LoopEnd => loop_level -= 1,
                                TokenType::StdIn |
                                TokenType::StdOut => {}
                                _ => {}
                            }
                        }
                    } else {
                        loop_stack.push(interpreter.pp); 
                    }
                },
                TokenType::LoopEnd => {
                    profile_if!(print_profiler, count_vector, interpreter, tokens);
                    if interpreter.dt[interpreter.dp] != 0 {
                        if let Some(loop_start) = loop_stack.last() { 
                            interpreter.pp = *loop_start;
                            profile_if!(print_profiler, count_vector, interpreter, tokens);
                        }
                    } else {
                        let _pp = loop_stack.pop(); 
                    }
                },
                TokenType::Nop => {},
            }
            interpreter.pp += 1;
        }
        if print_profiler {
            Profiler::print_profile(&count_vector);
            let mut i = 0;
            while i < simple_loop_index.len() {
                Profiler::simple_loop(&mut count_vector, 10);
                i += 1;
            }
            println!("{:?}", simple_loop_index);
            println!("{:#?}", count_vector);
        }
        Ok(())
    }
}