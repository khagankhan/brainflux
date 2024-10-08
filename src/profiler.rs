use crate::{implementation::TokenType, cli::BrainFluxError};
use prettytable::{format, Table, row};

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
    pub fn get_simple_loops(&self) -> &Vec<(usize, usize)> {
        &self.simple_loop
    }
    pub fn get_non_simple_loops(&self) -> &Vec<(usize, usize)> {
        &self.non_simple_loop
    }
    pub fn update_tokens(&mut self, tokens: &Vec<TokenType>) {
        for i in 0..tokens.len() {
            self.count_vector[i].0 = tokens[i].clone();
        }
    }
    pub fn print_number_of_executions(&self) {
        for (index, tuple) in self.count_vector.iter().enumerate() {
            println!("{:<5}|    {:<3}|  {:<5}", index, &tuple.0, tuple.1);
        }
    }
    pub fn print_profile(&self, print_profiler: bool, tokens: &Vec<TokenType>)->BrainFluxError<()> {
        print!("\n");
        if print_profiler {
            let mut simple_loop_chars: Vec<(usize, String, u32)> = Vec::with_capacity(tokens.len());
            let mut updated_tokens: Vec<String> = Vec::with_capacity(tokens.len());
            // Collecting simple_loop_chars
            for index in self.simple_loop.iter() {
                let chars: String = self.count_vector[index.0..(index.1 + 1)]
                    .iter()
                    .map(|item| item.0.clone().to_string()) 
                    .collect();
                simple_loop_chars.push((index.0, chars, self.count_vector.get(index.1).unwrap().1));
            }
            for index in self.simple_loop.iter() {
                let chars: String = tokens[index.0..(index.1 + 1)]
                    .iter()
                    .map(|item| item.clone().to_string()) 
                    .collect();
                updated_tokens.push(chars);
            }
            // Create a vector of indices based on the original order
            let mut indices: Vec<usize> = (0..simple_loop_chars.len()).collect();
            // Sort the indices based on the sorting of simple_loop_chars
            indices.sort_by(|&i, &j| simple_loop_chars[j].2.cmp(&simple_loop_chars[i].2));
            // Rearrange updated_tokens based on the sorted indices
            let sorted_updated_tokens: Vec<_> = indices.iter().map(|&i| updated_tokens[i].clone()).collect();
            // Now sort simple_loop_chars the same way
            simple_loop_chars.sort_by(|a, b| b.2.cmp(&a.2));
            // Display the result in the table
            let mut i: i32 = 0;
            let mut table = Table::new();
            println!("\t\t\t\t\tSimple innermost loops:");
            table.set_titles(row!["Index", "Original loop", "#Execs", "After the optimization phase"]);
            
            for (index, character, count) in &simple_loop_chars {
                table.add_row([index.to_string(), character.clone(), count.to_string(), sorted_updated_tokens[i as usize].clone()].into());
                i += 1;
            }
            
            table.set_format(*format::consts::FORMAT_NO_LINESEP_WITH_TITLE);
            table.printstd();            
           //////////////////////////// NON-SIMPLE LOOPS ////////////////////////////
           let mut non_simple_loop_chars: Vec<(usize, String, u32)> = Vec::new();
           // Collecting non_simple_loop_chars
           for index in self.non_simple_loop.iter() {
               let chars: String = self.count_vector[index.0..(index.1 + 1)]
                   .iter()
                   .map(|item| item.0.clone().to_string()) 
                   .collect();
               non_simple_loop_chars.push((index.0, chars, self.count_vector.get(index.1).unwrap().1));
           }
           // Clear and collect updated_tokens for non-simple loops
           updated_tokens.clear();
           for index in self.non_simple_loop.iter() {
               let chars: String = tokens[index.0..(index.1 + 1)]
                   .iter()
                   .map(|item| item.clone().to_string()) 
                   .collect();
               updated_tokens.push(chars);
           }
           // Create a vector of indices based on the original order of non_simple_loop_chars
           let mut indices: Vec<usize> = (0..non_simple_loop_chars.len()).collect();
           // Sort the indices based on the sorting of non_simple_loop_chars (by third element)
           indices.sort_by(|&i, &j| non_simple_loop_chars[j].2.cmp(&non_simple_loop_chars[i].2));
           // Rearrange updated_tokens based on the sorted indices
           let sorted_updated_tokens: Vec<_> = indices.iter().map(|&i| updated_tokens[i].clone()).collect();
           // Sort non_simple_loop_chars the same way
           non_simple_loop_chars.sort_by(|a, b| b.2.cmp(&a.2));
           // Display the result in the table
           println!("\t\t\tNon_simple innermost loops:");
           let mut table = Table::new();
           table.set_titles(row!["Index", "Original loop", "#Execs", "After the optimization phase"]);
           let mut i = 0;
           for (index, character, count) in &non_simple_loop_chars {
               table.add_row([index.to_string(), character.clone(), count.to_string(), sorted_updated_tokens[i].clone()].into());
               i += 1;
           }
           table.set_format(*format::consts::FORMAT_NO_LINESEP_WITH_TITLE);
           table.printstd();           
        }
        Ok(())
    }
    // For interpreter mode, it can show us how many times a given token is executed
    // You can see sometimes a token just executed thousands of times that can be optimized
    pub fn count_executions(&mut self, index: usize, print_profiler: bool) {
        if print_profiler {
            self.count_vector[index].1 += 1;
        }
    }
    pub fn loop_profiling(&mut self, tokens: &mut Vec<TokenType>) {
            // Clear the previous profilers after each phase of optimization
            self.inner_most.clear();
            self.simple_loop.clear();
            self.find_innermost_loop(tokens);
            self.simple_loop(tokens);
    }
    fn find_innermost_loop(&mut self, tokens: &mut Vec<TokenType>) {
        let mut stack: Vec<(TokenType, usize)> = Vec::new();
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
                if loop_level == previous_loop_level { // This is the core. If the loop level is staying the same so there is no inner loop.
                    self.inner_most.push((popped_index.1, index));
                }
                while index <tokens.len() - 1 && !stack.is_empty() {
                    index += 1;
                }
            }
        }
    }
    fn simple_loop(&mut self, tokens: &mut Vec<TokenType>) {
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
        let mut pointer_change = 0; // Pointer change should be zero in the end
        let mut cell_modifications = 0;  // Track modifications to p[0] (should be +1 or -1 to be zeroed)
        let mut loop_start = 0; // It should have one loop which is itself
        let mut loop_end = 0;
        for ch in chars {
            match ch {
                TokenType::LoopStart => {
                    loop_start += 1;
                },
                TokenType::LoopEnd => {
                    loop_end += 1;
                },
                TokenType::StdOut | TokenType::StdIn => return false,     
                TokenType::DecrementPointer => pointer_change -= 1,       
                TokenType::IncrementPointer => pointer_change += 1,        
                TokenType::IncrementValue => {                             
                    if pointer_change == 0 {                               
                        cell_modifications += 1;
                    }
                }
                TokenType::DecrementValue => {                            
                    if pointer_change == 0 {                              
                        cell_modifications -= 1;
                    }
                }
                TokenType::DecrementPointerN(n) => pointer_change -= n,        
                TokenType::IncrementPointerN(n) => pointer_change += n,        
                TokenType::IncrementValueN(n) => {                             
                    if pointer_change == 0 {                               
                        cell_modifications += n;
                    }
                }
                TokenType::DecrementValueN(n) => {                  
                    if pointer_change == 0 {                               
                        cell_modifications -= n;
                    }
                }
                _ => {} 
            }
        }
        pointer_change == 0 && (cell_modifications == 1 || cell_modifications == -1) && (loop_start == 1 && loop_end == 1)
    }
}