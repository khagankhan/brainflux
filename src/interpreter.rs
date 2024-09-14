use crate::cli::*;
use clap::Parser;
use std::io::Read;

#[derive(Debug)]
pub struct Interpreter {
   dp: usize,
   pp: usize,
   dt: Vec<u8>,
}
#[derive(Debug)]
enum TokenType {
    IncrementPointer,
    DecrementPointer,
    IncrementValue,
    DecrementValue,
    StdOut,
    StdIn,
    LoopStart,
    LoopEnd,
}
impl Interpreter {
    pub fn new() -> Self {
        Self {
            dp: 0,
            pp: 0,
            dt: vec![0; 30_000],
        }
    }
    pub fn start(&mut self) -> BrainFluxError<()> {
        let args = Args::parse();
        let mut file = args.open(&args.source_file)?;
        let mut buf = Vec::new();
        file.read_to_end(&mut buf)?; 
        self.run(&buf)?; 
        Ok(())
    }
    fn run(&mut self, source_file: &[u8]) -> BrainFluxError<()> {
        let tokens = self.tokenize(source_file)?;
        self.interpret(&tokens)?;
        Ok(())
    }
    fn tokenize(&mut self, source_file: &[u8]) -> BrainFluxError<Vec<TokenType>> {
        let mut tokens: Vec<TokenType> = Vec::new();
        for byte in source_file.iter() {
            match byte {
                b'>' => tokens.push(TokenType::IncrementPointer),
                b'<' => tokens.push(TokenType::DecrementPointer),
                b'+' => tokens.push(TokenType::IncrementValue),
                b'-' => tokens.push(TokenType::DecrementValue),
                b'.' => tokens.push(TokenType::StdOut),
                b',' => tokens.push(TokenType::StdIn),
                b'[' => tokens.push(TokenType::LoopStart),
                b']' => tokens.push(TokenType::LoopEnd),
                _ => {},
            }
        }
        Ok(tokens)
    }
    fn interpret(&mut self, tokens: &Vec<TokenType>) -> BrainFluxError<()> {
        let mut loop_stack = Vec::new();
        while self.pp < tokens.len() {
            match tokens[self.pp] {
                TokenType::IncrementPointer => self.dp += 1,

                TokenType::DecrementPointer => self.dp -= 1,
                TokenType::IncrementValue => {
                    self.dt[self.dp] += 1;
                },
                TokenType::DecrementValue => self.dt[self.dp] -= 1,
                TokenType::StdOut => print!("{}", (self.dt[self.dp]) as char),
                TokenType::StdIn => {
                    let mut input = [0u8];
                    std::io::stdin().read_exact(&mut input)?;
                    self.dt[self.dp] = input[0];
                },
                TokenType::LoopStart => {
                    if self.dt[self.dp] == 0 {
                        let mut loop_level = 1;
                        while loop_level > 0 {
                            self.pp += 1;
                            match tokens[self.pp] {
                                TokenType::LoopStart => loop_level += 1,
                                TokenType::LoopEnd => loop_level -= 1,
                                _ => {}
                            }
                        }
                    } else {
                        loop_stack.push(self.pp); 
                    }
                },
                TokenType::LoopEnd => {
                    if self.dt[self.dp] != 0 {
                        if let Some(loop_start) = loop_stack.last() { 
                            self.pp = *loop_start;
                        }
                    } else {
                        loop_stack.pop(); 
                    }
                },
            }
            self.pp += 1;
        }
        Ok(())
    }    
}