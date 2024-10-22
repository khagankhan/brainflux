use crate::{implementation::TokenType, cli::BrainFluxError};
use prettytable::{format, Table, row};
use std::io::Write;
use std::fs::OpenOptions;
use std::path::Path;

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
            let mut simple_loop_chars_html: Vec<(usize, String, u32)> = Vec::with_capacity(tokens.len());
            let mut updated_tokens_html: Vec<String> = Vec::with_capacity(tokens.len());
            let mut simple_loop_chars_string: Vec<(usize, String, u32)> = Vec::with_capacity(tokens.len());
            let mut updated_tokens_string: Vec<String> = Vec::with_capacity(tokens.len());
            // Collecting simple_loop_chars
            for index in self.simple_loop.iter() {
                let chars: String = self.count_vector[index.0..(index.1 + 1)]
                    .iter()
                    .map(|item| item.0.clone().to_html()) 
                    .collect();
                simple_loop_chars_html.push((index.0, chars, self.count_vector.get(index.1).unwrap().1));
                let chars_string: String = self.count_vector[index.0..(index.1 + 1)]
                .iter()
                .map(|item| item.0.clone().to_string()) 
                .collect();
                simple_loop_chars_string.push((index.0, chars_string, self.count_vector.get(index.1).unwrap().1));
            }
            for index in self.simple_loop.iter() {
                let chars: String = tokens[index.0..(index.1 + 1)]
                    .iter()
                    .map(|item| item.clone().to_html()) 
                    .collect();
                updated_tokens_html.push(chars);
                let chars_string: String = tokens[index.0..(index.1 + 1)]
                    .iter()
                    .map(|item| item.clone().to_string()) 
                    .collect();
                updated_tokens_string.push(chars_string);
            }
            // Create a vector of indices based on the original order
            let mut indices: Vec<usize> = (0..simple_loop_chars_html.len()).collect();
            // Sort the indices based on the sorting of simple_loop_chars
            indices.sort_by(|&i, &j| simple_loop_chars_html[j].2.cmp(&simple_loop_chars_html[i].2));
            // Rearrange updated_tokens based on the sorted indices
            let sorted_updated_tokens: Vec<_> = indices.iter().map(|&i| updated_tokens_html[i].clone()).collect();
            let sorted_updated_tokens_string: Vec<_> = indices.iter().map(|&i| updated_tokens_string[i].clone()).collect();
            // Now sort simple_loop_chars the same way
            simple_loop_chars_html.sort_by(|a, b| b.2.cmp(&a.2));
            simple_loop_chars_string.sort_by(|a, b| b.2.cmp(&a.2));
            // Display the result in the table
            let mut table = Table::new();
            println!("\t\t\t\t\tSimple innermost loops:");
            table.set_titles(row!["Index", "Original loop", "#Execs", "After the optimization phase"]);
            let mut i = 0;
            let mut test_vec: Vec<Vec<String>> = Vec::with_capacity(tokens.len()*4);
            for index in 0..simple_loop_chars_html.len() {
                let vec = [simple_loop_chars_html[i].0.to_string(), simple_loop_chars_html[i].1.clone(), simple_loop_chars_html[i].2.to_string(), sorted_updated_tokens[i].clone()].to_vec();
                test_vec.push(vec);
                let vec = [simple_loop_chars_string[i].0.to_string(), simple_loop_chars_string[i].1.clone(), simple_loop_chars_string[i].2.to_string(), sorted_updated_tokens_string[i].clone()].to_vec();
                table.add_row(vec.into());
                i += 1;
            } 
            table.set_format(*format::consts::FORMAT_NO_LINESEP_WITH_TITLE);
            table.printstd();
            Self::generate_html(&test_vec, "simple_loops.html")?;         
           //////////////////////////// NON-SIMPLE LOOPS ////////////////////////////
           let mut non_simple_loop_chars_html: Vec<(usize, String, u32)> = Vec::new();
           let mut non_simple_loop_chars_string: Vec<(usize, String, u32)> = Vec::new();
           // Collecting non_simple_loop_chars
           for index in self.non_simple_loop.iter() {
               let chars: String = self.count_vector[index.0..(index.1 + 1)]
                   .iter()
                   .map(|item| item.0.clone().to_html()) 
                   .collect();
               non_simple_loop_chars_html.push((index.0, chars, self.count_vector.get(index.1).unwrap().1));
               let chars: String = self.count_vector[index.0..(index.1 + 1)]
               .iter()
               .map(|item| item.0.clone().to_string()) 
               .collect();
               non_simple_loop_chars_string.push((index.0, chars, self.count_vector.get(index.1).unwrap().1));
           }
           // Clear and collect updated_tokens for non-simple loops
           updated_tokens_html.clear();
           updated_tokens_string.clear();
           for index in self.non_simple_loop.iter() {
               let chars: String = tokens[index.0..(index.1 + 1)]
                   .iter()
                   .map(|item| item.clone().to_html()) 
                   .collect();
               updated_tokens_html.push(chars);
               let chars: String = tokens[index.0..(index.1 + 1)]
               .iter()
               .map(|item| item.clone().to_string()) 
               .collect();
               updated_tokens_string.push(chars);
           }
           // Create a vector of indices based on the original order of non_simple_loop_chars
           let mut indices: Vec<usize> = (0..non_simple_loop_chars_html.len()).collect();
           // Sort the indices based on the sorting of non_simple_loop_chars (by third element)
           indices.sort_by(|&i, &j| non_simple_loop_chars_html[j].2.cmp(&non_simple_loop_chars_html[i].2));
           // Rearrange updated_tokens based on the sorted indices
           let sorted_updated_tokens: Vec<_> = indices.iter().map(|&i| updated_tokens_html[i].clone()).collect();
           let sorted_updated_tokens_string: Vec<_> = indices.iter().map(|&i| updated_tokens_string[i].clone()).collect();
           // Sort non_simple_loop_chars the same way
           non_simple_loop_chars_html.sort_by(|a, b| b.2.cmp(&a.2));
           non_simple_loop_chars_string.sort_by(|a, b| b.2.cmp(&a.2));
           // Display the result in the table
           let mut table = Table::new();
           println!("\t\t\t\t\tNon-simple innermost loops:");
           table.set_titles(row!["Index", "Original loop", "#Execs", "After the optimization phase"]);
           let mut i = 0;
           let mut test_vec: Vec<Vec<String>> = Vec::with_capacity(tokens.len()*4);
           for index in 0..non_simple_loop_chars_html.len() {
               let vec = [non_simple_loop_chars_html[i].0.to_string(), non_simple_loop_chars_html[i].1.clone(), non_simple_loop_chars_html[i].2.to_string(), sorted_updated_tokens[i].clone()].to_vec();
               test_vec.push(vec);
               let vec = [non_simple_loop_chars_string[i].0.to_string(), non_simple_loop_chars_string[i].1.clone(), non_simple_loop_chars_string[i].2.to_string(), sorted_updated_tokens_string[i].clone()].to_vec();
               table.add_row(vec.into());
               i += 1;
           } 
           table.set_format(*format::consts::FORMAT_NO_LINESEP_WITH_TITLE);
           table.printstd();
           Self::generate_html(&test_vec, "non_simple_loops.html")?;            
        }
        Ok(())
    }        
    fn generate_html(test_vec: &Vec<Vec<String>>, file_path: &str) -> BrainFluxError<()> {
        let prologue = r#"
            <!DOCTYPE html>
            <html lang="en">
            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Colored Loop Profiling</title>
                <style>
                    table {
                        width: 100%;
                        margin: 20px auto;
                        border-collapse: collapse;
                    }
                    th, td {
                        padding: 10px;
                        text-align: left;
                        border: 1px solid black;
                    }
                    th {
                        background-color: #f2f2f2;
                    }
                    td {
                        white-space: pre-wrap;
                    }
                    /* Expand the first column */
                    td:nth-child(2) {
                        width: 40%; 
                        max-width: 500px; 
                        word-wrap: break-word;  
                        word-break: break-all; 
                        white-space: normal;  
                    }                    
                    td:nth-child(4) {
                        width:60%; 
                        min-width: 300px; 
                    }
                    
                </style>
            </head>
            <body>
        "#;
        let epilogue = r#"
            </body>
            </html>
        "#;
        let table_prologue = r#"
            <table>
                <thead>
                    <tr>
                        <th>Index</th>
                        <th>Original Loop</th>
                        <th>Number of Executions</th>
                        <th>After Optimizations</th> <!-- Fourth column -->
                    </tr>
                </thead>
                <tbody>
        "#;
    
        let table_epilogue = r#"
                </tbody>
            </table>
            <br/> <!-- Add a line break between tables -->
        "#;
        let file_exists = Path::new(file_path).exists();
        // Open the file in append mode
        let mut file = OpenOptions::new()
            .append(true)
            .create(true)
            .open(file_path)?;
    
        if !file_exists {
            writeln!(file, "{}", prologue)?;
        }
        writeln!(file, "{}", table_prologue)?;
        for row in test_vec {
            writeln!(
                file,
                "<tr><td>{}</td><td>{}</td><td>{}</td><td>{}</td></tr>",
                row[0],
                row[1],
                row[2],
                row[3]
            )?;
        }
        writeln!(file, "{}", table_epilogue)?;
        if !file_exists {
            writeln!(file, "{}", epilogue)?;
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