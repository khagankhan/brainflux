use crate::{cli::*, interpreter::Interpreter};
use clap::Parser;
use std::{io::Read};

#[derive(Debug)]
pub struct Implementation {
   pub dp: usize,
   pub pp: usize,
   pub dt: Vec<u8>,
}
#[derive(Debug, Eq, Hash, PartialEq, Clone)]
pub enum TokenType {
    IncrementPointer,
    DecrementPointer,
    IncrementValue,
    DecrementValue,
    StdOut,
    StdIn,
    LoopStart,
    LoopEnd,
    Nop,
}
impl Implementation {
    pub fn new() -> Self {
        Self {
            dp: 0,
            pp: 0,
            dt: vec![0; 30_000],
        }
    }
    pub fn start(&mut self) -> BrainFluxError<()> {
        let args = Args::parse();
        let mut file = args.open(args.get_source_file())?;
        let mut buf = Vec::new();
        file.read_to_end(&mut buf)?; 
        let test_target = args.get_test_target();
        let print_profiler = args.get_profile();
        self.run(&buf, test_target, print_profiler)?; 
        Ok(())
    }
    fn run(&mut self, source_file: &[u8], test_target: &str, print_profiler: bool) -> BrainFluxError<()> {
        let tokens = self.tokenize(source_file)?;
        match test_target {
            "interp" | "interpreter" => self.interpret(&tokens, print_profiler)?,
            "x86-64" | "x64" => self.x64_compiler(&tokens)?,
            "arm64" | "a64"  => self.arm_compiler(&tokens)?,
            "webassembly" | "wasm" => self.wasm_compiler(&tokens)?,
            _ => {
                eprintln!("[-] Error: Invalid target.\n[+]Usage: --test-target <interp/x86-64/arm64/wasm>");
                std::process::exit(64);
            },
        }
        Ok(())
    }
    /// Tokenize the source file
    fn tokenize(&self, source_file: &[u8]) -> BrainFluxError<Vec<TokenType>> {
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
    /// Token types tp characters to display
    pub fn token_to_char(ttype:&TokenType) -> char {
        match ttype {
            TokenType::IncrementPointer => '>',
            TokenType::DecrementPointer => '<',
            TokenType::IncrementValue => '+',
            TokenType::DecrementValue => '-',
            TokenType::StdOut => '.',
            TokenType::StdIn => ',',
            TokenType::LoopStart => '[',
            TokenType::LoopEnd => ']',
            TokenType::Nop => '*',
        }
    }
    /// The interpreter that runs the provided tokens
    fn interpret(&mut self, tokens: &Vec<TokenType>, print_profiler: bool) -> BrainFluxError<()> {
        Interpreter::interpret(self, tokens, print_profiler)?;
        Ok(())
    }
    /// Arm64 compiler that directly compiles to the Arm64 assembly code
    fn arm_compiler(&mut self, tokens: &Vec<TokenType>) -> BrainFluxError<()> {
        println!("Place Holder: Arm compiler will be implemented");
        Ok(())
    }    
    /// x64 compiler that directly compiles to the x86-644 assembly code
    fn x64_compiler(&mut self, tokens: &Vec<TokenType>) -> BrainFluxError<()> {
        println!("Place Holder: x86-64 compiler will be implemented");
        Ok(())
    }  
    /// wasm compiler that directly compiles to the Wasm code
    fn wasm_compiler(&mut self, tokens: &Vec<TokenType>) -> BrainFluxError<()> {
        println!("Place Holder: Wasm compiler will be implemented");
        Ok(())
    }
}