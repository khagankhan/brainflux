use crate::implementation::{TokenType, Implementation};

#[derive(Debug, Clone)]
pub struct Profiler{
    count_vector: Vec<(TokenType, u32)>,
    inner_most: Vec<(usize, usize)>,
    simple_loop: Vec<(usize, usize)>,
    non_simple_loop: Vec<(usize, usize)>,
}
impl Profiler {
    pub fn with_tokens(tokens: &mut Vec<TokenType>) -> Self {
        let mut count_vector = Vec::with_capacity(tokens.len());
        for token in tokens.iter() {
            let pair = (token.clone(), 0 as u32);
            count_vector.push(pair);
        }
        Self {
            count_vector,
            inner_most: vec![],
            simple_loop: vec![],
            non_simple_loop: vec![],
        }
    }
    pub fn new() -> Self {
        Self {
            count_vector: vec![],
            inner_most: vec![],
            simple_loop: vec![],
            non_simple_loop: vec![],
        }
    }
    pub fn print_profile(&self, print_profiler: bool) {
        print!("\n");
        if print_profiler {
            for (index, tuple) in self.count_vector.iter().enumerate() {
                println!("{:<5}|    {:<3}|  {:<5}", index, Implementation::token_to_char(&tuple.0), tuple.1);
           }

           println!("-----------------------------------");
           println!("Simple innermost loops:");
           let mut simple_loop_chars: Vec<(usize, String, u32)> = Vec::new();
           for index in self.simple_loop.iter() {
            let chars: String = self.count_vector[index.0..(index.1 + 1)]
                .iter()
                .map(|item| Implementation::token_to_char(&item.0)) // Assuming item.0 is a char
                .collect();
                simple_loop_chars.push((index.0, chars, self.count_vector.get(index.1).unwrap().1));
           }
           simple_loop_chars.sort_by(|a, b| b.2.cmp(&a.2));
           for (index, character, count) in &simple_loop_chars {
               println!("{}     {:<35}     {}", index, character, count);
           }

           println!("-----------------------------------");
           println!("Non_imple innermost loops:");
           let mut non_simple_loop_chars: Vec<(usize, String, u32)> = Vec::new();
           for index in self.non_simple_loop.iter() {
            let chars: String = self.count_vector[index.0..(index.1 + 1)]
                .iter()
                .map(|item| Implementation::token_to_char(&item.0)) // Assuming item.0 is a char
                .collect();
                simple_loop_chars.push((index.0, chars, self.count_vector.get(index.1).unwrap().1));
           }
           non_simple_loop_chars.sort_by(|a, b| b.2.cmp(&a.2));
           for (index, character, count) in &non_simple_loop_chars {
               println!("{}     {:<35}     {}", index, character, count);
           }
        }
        }
    pub fn count_executions(&mut self, index: usize, print_profiler: bool) {
        if print_profiler {
            self.count_vector[index].1 += 1;
        }
    }
    pub fn loop_profiling(&mut self, tokens: &mut Vec<TokenType>, print_profiler: bool) {
        if print_profiler {
            self.find_innermost_loop(tokens);
            self.simple_loop(tokens);
        }
    }
    pub fn zero_cell(tokens: &mut Vec<TokenType>) {
        let count_len = tokens.len();
        for index in 0..count_len.saturating_sub(2) {
            if let (Some(current_char), Some(next_char), Some(next_next_char)) = (
                tokens.get(index),
                tokens.get(index + 1),
                tokens.get(index + 2),
            ) {
                if *current_char == TokenType::LoopStart 
                    && (*next_char == TokenType::IncrementValue || *next_char == TokenType::DecrementValue) 
                    && *next_next_char == TokenType::LoopEnd 
                {
                    tokens[index] = TokenType::ZeroCell;
                    tokens[index + 1] = TokenType::Nop;
                    tokens[index + 2] = TokenType::Nop;
                }
            }
        }
    }
    fn find_innermost_loop(&mut self, tokens: &mut Vec<TokenType>/* Add reference to vector of tokens here like zerocell */) {
        let mut stack: Vec<(TokenType, usize)> = Vec::new(); // Stack to track '(' and their indices
        let mut loop_level = 0;
        let mut previous_loop_level = -1;
        for mut index in 0..tokens.len() {
            if let Some(TokenType::LoopStart) = tokens.get(index) {
                stack.push((TokenType::LoopStart, index));
                previous_loop_level = loop_level;
                loop_level += 1;
            } else if let Some (TokenType::LoopEnd) = tokens.get(index) {
                let popped_index = stack.pop().unwrap();
                loop_level -= 1;
                if loop_level == previous_loop_level {
                    self.inner_most.push((popped_index.1, index));
                }
                while index <tokens.len() - 1 && !stack.is_empty() {
                    index += 1;
                }
            }
        }
    }
    fn simple_loop(&mut self, tokens: &mut Vec<TokenType> /* Add reference to vector of tokens here like zerocell */) {
        for index in self.inner_most.iter() {
            let types: Vec<TokenType> = tokens[index.0..=index.1]
                .iter()
                .map(|token_type| token_type.clone()) 
                .collect(); 
            if self.is_simple_loop(&types) {
               self.simple_loop.push(index.clone());
            } else {
                self.non_simple_loop.push(index.clone());
            }
        }
    }
    fn is_simple_loop(&self, chars: &Vec<TokenType>) -> bool {
        let mut pointer_change = 0;
        let mut modifies_cell = false;
        for ch in chars {
            match ch {
                TokenType::StdOut | TokenType::StdIn => return false, // No I/O allowed
                TokenType::DecrementPointer => pointer_change -= 1, // Moving pointer left
                TokenType::IncrementPointer => pointer_change += 1, // Moving pointer right
                TokenType::IncrementValue | TokenType::DecrementValue => modifies_cell = true, // Modifies p[0]
                _ => {} // Ignore other commandnns
            }
        }
        pointer_change == 0 && modifies_cell
    }
}