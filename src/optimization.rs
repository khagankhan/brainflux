use crate::implementation::{TokenType, Implementation};

#[derive(Debug, Clone)]
pub struct Profiler{
    count_vector: Vec<(char, u32)>,
    zero_cell: Vec<usize>,
    inner_most: Vec<(usize, usize)>,
}

impl Profiler {
    pub fn new(tokens: &Vec<TokenType>) -> Self {
        let mut count_vector = Vec::with_capacity(tokens.len());
        for token in tokens.iter() {
            let pair = (Implementation::token_to_char(token), 0 as u32);
            count_vector.push(pair);
        }
        Self {
            count_vector,
            zero_cell: vec![],
            inner_most: vec![],
        }
    }
    pub fn print_profile(&self, print_profiler: bool) {
        print!("\n");
        if print_profiler {
            for (index, tuple) in self.count_vector.iter().enumerate() {
                println!("{:<5}|    {:<3}|  {:<5}", index, tuple.0, tuple.1);
           }
           println!("-----------------------------------");
           println!("Zero cell loops:");
           for index in self.zero_cell.iter() {
            let chars: String = self.count_vector[*index..*index + 3]
                .iter()
                .map(|&item| item.0) // Assuming item.0 is a char
                .collect();
            println!("ZeroCell loop at index {} is: {}", index, chars);
           }
           println!("-----------------------------------");
           println!("Simple nnermost loops:");
           let mut simple_loop_chars: Vec<(usize, String, u32)> = Vec::new();
           for index in self.inner_most.iter() {
            let chars: String = self.count_vector[index.0..(index.1 + 1)]
                .iter()
                .map(|&item| item.0) // Assuming item.0 is a char
                .collect();
            if self.is_simple_loop(&chars) {
                simple_loop_chars.push((index.0, chars, self.count_vector.get(index.1).unwrap().1));
            }
           }
           simple_loop_chars.sort_by(|a, b| b.2.cmp(&a.2));
           for (index, character, count) in &simple_loop_chars {
               println!("{}     {:<35}     {}", index, character, count);
           }
        }
    }
    pub fn count_executions(&mut self, index: usize, print_profiler: bool) {
        if print_profiler {
            self.count_vector[index].1 += 1;
        }
    }
    pub fn loop_profiling(&mut self, print_profiler: bool) {
        if print_profiler {
            self.zero_cell();
            self.find_innermost_loop();
        }
    }
    fn zero_cell(&mut self) {
        let count_len = self.count_vector.len();
        for index in 0..count_len.saturating_sub(2) {
            if let (Some((current_char, _)), Some((next_char, _)), Some((next_next_char, _))) = (
                self.count_vector.get(index),
                self.count_vector.get(index + 1),
                self.count_vector.get(index + 2),
            ) {
                if *current_char == '[' && (*next_char == '+' || *next_char == '-') && *next_next_char == ']' {
                    self.zero_cell.push(index);
                }
            }
        }
    }
    fn find_innermost_loop(&mut self) {
        let mut stack: Vec<(char, usize)> = Vec::new(); // Stack to track '(' and their indices
        let mut loop_level = 0;
        let mut previous_loop_level = -1;
        for mut index in 0..self.count_vector.len() {
            if let Some(('[', _)) = self.count_vector.get(index) {
                stack.push(('[', index));
                previous_loop_level = loop_level;
                loop_level += 1;
            } else if let Some((']', _)) = self.count_vector.get(index) {
                let popped_index = stack.pop().unwrap();
                loop_level -= 1;
                if loop_level == previous_loop_level {
                    self.inner_most.push((popped_index.1, index));
                }
                while index < self.count_vector.len() - 1 && !stack.is_empty() {
                    index += 1;
                }
            }
        }
    }
    fn is_simple_loop(&self, chars: &String) -> bool {
        let mut pointer_change = 0;
        let mut modifies_cell = false;
        for ch in chars.chars() {
            match ch {
                '.' | ',' => return false, // No I/O allowed
                '<' => pointer_change -= 1, // Moving pointer left
                '>' => pointer_change += 1, // Moving pointer right
                '+' | '-' => modifies_cell = true, // Modifies p[0]
                _ => {} // Ignore other commandnns
            }
        }
        pointer_change == 0 && modifies_cell
    }
}