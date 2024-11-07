use crate::{cli::*, interpreter::Interpreter, arm_compiler::ArmCompiler, llvm_compiler::LLVMCompiler};
use clap::Parser;
use std::io::Read;
use std::fmt::{self, Formatter, Display};

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
    // Non-specificaton instructions
    Nop,
    IncrementValueN(i32),
    DecrementValueN(i32),
    IncrementPointerN(i32),
    DecrementPointerN(i32),
    ZeroAndModify(Vec<(i32, i32, i32)>),
    MemoryScan(i32),}
impl TokenType {
    pub fn to_html(&self) -> String {
        match self {
            TokenType::IncrementPointer => format!("<span style='color: red;'>&gt;</span>"),
            TokenType::DecrementPointer => format!("<span style='color: red;'>&lt;</span>"),
            TokenType::IncrementValue => format!("<span style='color: blue;'>+</span>"),
            TokenType::DecrementValue => format!("<span style='color: blue;'>-</span>"),
            TokenType::StdOut => format!("<span style='color: magenta;'>.</span>"),
            TokenType::StdIn => format!("<span style='color: magenta;'>,</span>"),
            TokenType::LoopStart => format!("<span style='color: balck;'>[</span>"),
            TokenType::LoopEnd => format!("<span style='color: black;'>]</span>"),
            TokenType::Nop => String::new(),
            TokenType::IncrementValueN(n) => format!("<span style='color: blue;'>(+{})</span>", n),
            TokenType::DecrementValueN(n) => format!("<span style='color: blue;'>(-{})</span>", n),
            TokenType::IncrementPointerN(n) => format!("<span style='color: red;'>(>{})</span>", n),
            TokenType::DecrementPointerN(n) => format!("<span style='color: red;'>(<{})</span>", n),
            TokenType::MemoryScan(n) => format!("<span style='color: green;'>M({})</span>", n),
            TokenType::ZeroAndModify(mods) => {
                let mods_str: Vec<String> = mods.iter()
                    .map(|(ptr, val, nes)| format!("({}{}{})",
                        if *ptr >= 0 { format!("<span style='color: red;'>&gt;{}</span>", ptr) } else { format!("<span style='color: red;'>&lt;{}</span>", -ptr) },
                        if *val >= 0 { format!("<span style='color: blue;'>+{}</span>", val) } else { format!("<span style='color: blue;'>-{}</span>", -val) },
                        if *nes >= 0 { format!("<span style='color: orange;'>&gt;{}</span>", nes) } else { format!("<span style='color: orange;'>&lt;{}</span>", -nes) } ))
                    .collect();
                format!("<span style='color: purple;'>Z[{}]</span>", mods_str.join(", "))
            },
        }
    }
}
impl Display for TokenType {
    fn fmt(&self, f: &mut Formatter) -> fmt::Result {
        let s = match self {
            TokenType::IncrementPointer => &format!(">"),
            TokenType::DecrementPointer => &format!("<"),
            TokenType::IncrementValue => &format!("+"),
            TokenType::DecrementValue => &format!("-"),
            TokenType::StdOut => &format!("."),
            TokenType::StdIn => &format!(","),
            TokenType::LoopStart => "[",
            TokenType::LoopEnd => "]",
            TokenType::Nop => "",
            TokenType::IncrementValueN(n) => &format!("(+{})", n),
            TokenType::DecrementValueN(n) => &format!("(-{})", n),
            TokenType::IncrementPointerN(n) => &format!("(>{})", n),
            TokenType::DecrementPointerN(n) => &format!("(<{})", n),
            TokenType::MemoryScan(n) => &format!("M({})", n),
            TokenType::ZeroAndModify(mods) => {
                let mods_str: Vec<String> = mods.iter()
                    .map(|(ptr, val, nes)| format!("({}{}{})", if *ptr >= 0 { format!(">{}", ptr) } else { format!("<{}", -ptr) }, 
                        if *val >= 0 { format!("+{}", val) } else { format!("-{}", -val) },
                        if *nes >= 0 { format!(">{}", nes) } else { format!("<{}", -nes) }))
                    .collect();
                &format!("Z[{}]", mods_str.join(", "))
            },
        };
        f.write_str(s)
    }
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
        let optimize = args.get_optimize();
        self.run(&buf, test_target, print_profiler, optimize)?; 
        Ok(())
    }
    fn run(&mut self, source_file: &[u8], test_target: &str, print_profiler: bool, optimize: bool) -> BrainFluxError<()> {
        let mut tokens = self.tokenize(source_file)?;
        match test_target {
            "interp" | "interpreter" => self.interpret(&mut tokens, print_profiler, optimize)?,
            "x86-64" | "x64" => self.x64_compiler(&tokens)?,
            "arm64" | "a64"  => self.arm_compiler(&mut tokens, print_profiler, optimize)?,
            "webassembly" | "wasm" => self.wasm_compiler(&tokens)?,
            "llvm" | "llvm-compiler" => self.llvm_compiler(&mut tokens, print_profiler, optimize)?,
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
        let mut loop_stack: Vec<usize> = Vec::new(); // Stack to track the positions of '['
        for (i, byte) in source_file.iter().enumerate() {
            match byte {
                b'>' => tokens.push(TokenType::IncrementPointer),
                b'<' => tokens.push(TokenType::DecrementPointer),
                b'+' => tokens.push(TokenType::IncrementValue),
                b'-' => tokens.push(TokenType::DecrementValue),
                b'.' => tokens.push(TokenType::StdOut),
                b',' => tokens.push(TokenType::StdIn),
                b'[' => {
                    tokens.push(TokenType::LoopStart);
                    loop_stack.push(i); // Push the position of the '[' onto the stack
                }
                b']' => {
                    if loop_stack.pop().is_none() {
                        // If there's no matching '[' for this ']', return an error
                        eprintln!("[-] Error: Unmatched ']' at position {}", i);
                        std::process::exit(-1);
                    }
                    tokens.push(TokenType::LoopEnd);
                }
                _ => {},
            }
        }
        if !loop_stack.is_empty() {
            eprintln!("[-] Error: Unmatched '[' at position {}",
                loop_stack.pop().unwrap() // It is not empty can unwrap()
            );
            std::process::exit(-1);
        }
        Ok(tokens)
    }    
    /// The interpreter that runs the provided tokens
    fn interpret(&mut self, tokens: &mut Vec<TokenType>, print_profiler: bool,  optimize: bool) -> BrainFluxError<()> {
        Interpreter::interpret(self, tokens, print_profiler, optimize)?;
        Ok(())
    }
    /// Arm64 compiler that directly compiles to the Arm64 assembly code
    fn arm_compiler(&mut self, tokens: &mut Vec<TokenType>, print_profiler: bool, optimize: bool) -> BrainFluxError<()> {
        ArmCompiler::arm_compiler(tokens, print_profiler, optimize)?;
        Ok(())
    }    
    /// x64 compiler that directly compiles to the x86-644 assembly code
    fn x64_compiler(&mut self, tokens: &Vec<TokenType>) -> BrainFluxError<()> {
        println!("Place Holder: x86-64 compiler will be implemented");
        Ok(())
    }  
    /// Wasm compiler that directly compiles to the Wasm code
    fn wasm_compiler(&mut self, tokens: &Vec<TokenType>) -> BrainFluxError<()> {
        println!("Place Holder: Wasm compiler will be implemented");
        Ok(())
    }
    fn llvm_compiler(&mut self, tokens: &mut Vec<TokenType>, print_profiler: bool, optimize: bool) -> BrainFluxError<()> {
        LLVMCompiler::llvm_compiler(tokens, print_profiler, optimize)?;
        Ok(())
    }
}