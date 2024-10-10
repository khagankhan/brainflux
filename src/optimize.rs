use crate::cli::*;
use crate::implementation::*;
use crate::profiler::*;

pub struct Optimize;

impl Optimize {
    pub fn phase1(tokens: &mut Vec<TokenType>, optimize: bool, profiler: &Profiler) -> BrainFluxError<()>{
        if optimize {
            // Increment and decrement should be done first
            Self::sum_increment_decrement_values(tokens)?;
            Self::sum_increment_decrement_pointers(tokens)?;
            // Then we can do the loop optimizations
            Self::simple_loop_optimization(profiler, tokens)?;
            Self::memory_scan_optimization(profiler, tokens)?;
        }
        Ok(())
    }
    // The following sum_increment_decrement_pointers and the sum_increment_decrement_values
    // Just sums up the number of consecutive Increments to IncrementN(n) token and then supersedes the
    // index of the first Increment/Decrement token with update IncrementN/DecrementN token
    // and alters the rest with Nops
    fn sum_increment_decrement_pointers(tokens: &mut Vec<TokenType>) -> BrainFluxError<()>{
        let mut increment_pointer = 0;    
        let mut decrement_pointer = 0;    
    
        let mut increment_pointer_start: Option<usize> = None;  
        let mut decrement_pointer_start: Option<usize> = None;  

        for index in 0..tokens.len() {
            match tokens[index] {
                TokenType::IncrementPointer => {
                    if increment_pointer == 0 {
                        increment_pointer_start = Some(index);
                    }
                    increment_pointer += 1;
    
                    if decrement_pointer > 0 {
                        if let Some(start_idx) = decrement_pointer_start {
                            tokens[start_idx] = TokenType::DecrementPointerN(decrement_pointer as i32);
                            for i in (start_idx + 1)..index {
                                tokens[i] = TokenType::Nop;
                            }
                        }
                        decrement_pointer = 0;
                        decrement_pointer_start = None;
                    }
                }
                TokenType::DecrementPointer => {
                    if decrement_pointer == 0 {
                        decrement_pointer_start = Some(index);
                    }
                    decrement_pointer += 1;
                        if increment_pointer > 0 {
                        if let Some(start_idx) = increment_pointer_start {
                            tokens[start_idx] = TokenType::IncrementPointerN(increment_pointer as i32);
                            for i in (start_idx + 1)..index {
                                tokens[i] = TokenType::Nop;
                            }
                        }
                        increment_pointer = 0;
                        increment_pointer_start = None;
                    }
                }
                _ => {
                    if increment_pointer > 0 {
                        if let Some(start_idx) = increment_pointer_start {
                            tokens[start_idx] = TokenType::IncrementPointerN(increment_pointer as i32);
                            for i in (start_idx + 1)..index {
                                tokens[i] = TokenType::Nop;
                            }
                        }
                        increment_pointer = 0;
                        increment_pointer_start = None;
                    } 
                    if decrement_pointer > 0 {
                        if let Some(start_idx) = decrement_pointer_start {
                            tokens[start_idx] = TokenType::DecrementPointerN(decrement_pointer as i32);
                            for i in (start_idx + 1)..index {
                                tokens[i] = TokenType::Nop;
                            }
                        }
                        decrement_pointer = 0;
                        decrement_pointer_start = None;
                    }
                }
            }
        }
        if increment_pointer > 0 {
            if let Some(start_idx) = increment_pointer_start {
                tokens[start_idx] = TokenType::IncrementPointerN(increment_pointer as i32);
                for i in (start_idx + 1)..tokens.len() {
                    tokens[i] = TokenType::Nop;
                }
            }
        }
        if decrement_pointer > 0 {
            if let Some(start_idx) = decrement_pointer_start {
                tokens[start_idx] = TokenType::DecrementPointerN(decrement_pointer as i32);
                for i in (start_idx + 1)..tokens.len() {
                    tokens[i] = TokenType::Nop;
                }
            }
        }
        Ok(())
    }
    fn sum_increment_decrement_values(tokens: &mut Vec<TokenType>) -> BrainFluxError<()>{
        let mut increment_value = 0;     // For consecutive IncrementValue tokens
        let mut decrement_value = 0;     // For consecutive DecrementValue tokens
    
        let mut increment_value_start = None;  // Track the first IncrementValue index
        let mut decrement_value_start = None;  // Track the first DecrementValue index
    
        for index in 0..tokens.len() {
            match tokens[index] {
                TokenType::IncrementValue => {
                    if increment_value == 0 {
                        increment_value_start = Some(index);
                    }
                    increment_value += 1;
    
                    if decrement_value > 0 {
                        if let Some(start_idx) = decrement_value_start {
                            tokens[start_idx] = TokenType::DecrementValueN(decrement_value as i32);
                            for i in (start_idx + 1)..index {
                                tokens[i] = TokenType::Nop;
                            }
                        }
                        decrement_value = 0;
                        decrement_value_start = None;
                    }
                }
                TokenType::DecrementValue => {
                    if decrement_value == 0 {
                        decrement_value_start = Some(index);
                    }
                    decrement_value += 1;
    
                    // If switching from increment_value, replace previous increment sequence
                    if increment_value > 0 {
                        if let Some(start_idx) = increment_value_start {
                            tokens[start_idx] = TokenType::IncrementValueN(increment_value as i32);
                            for i in (start_idx + 1)..index {
                                tokens[i] = TokenType::Nop;
                            }
                        }
                        increment_value = 0;
                        increment_value_start = None;
                    }
                }
                _ => {
                    if increment_value > 0 {
                        if let Some(start_idx) = increment_value_start {
                            tokens[start_idx] = TokenType::IncrementValueN(increment_value as i32);
                            for i in (start_idx + 1)..index {
                                tokens[i] = TokenType::Nop;
                            }
                        }
                        increment_value = 0;
                        increment_value_start = None;
                    }
                    if decrement_value > 0 {
                        if let Some(start_idx) = decrement_value_start {
                            tokens[start_idx] = TokenType::DecrementValueN(decrement_value as i32);
                            for i in (start_idx + 1)..index {
                                tokens[i] = TokenType::Nop;
                            }
                        }
                        decrement_value = 0;
                        decrement_value_start = None;
                    }
                }
            }
        }
        if increment_value > 0 {
            if let Some(start_idx) = increment_value_start {
                tokens[start_idx] = TokenType::IncrementValueN(increment_value as i32);
                for i in (start_idx + 1)..tokens.len() {
                    tokens[i] = TokenType::Nop;
                }
            }
        }
        if decrement_value > 0 {
            if let Some(start_idx) = decrement_value_start {
                tokens[start_idx] = TokenType::DecrementValueN(decrement_value as i32);
                for i in (start_idx + 1)..tokens.len() {
                    tokens[i] = TokenType::Nop;
                }
            }
        }
        Ok(())
    }
    /*
    * This is how Zero and Modify Simple loop works:
    * 1. Profiler struct has simple_loop vector that holds a vector of tuples; a tuple in turn holds start and 
    * end index of all the simple loops in the source code. (That is why, I add Nop instead of removing the optimized
    * tokens; I can access the right index everytime. Another reason is that removing is expensive.)
    * 2. Then the new vectors are created based on those indexes. I filter out Nops so I can only "valid" tokens.
    * 3. When calculate multi modifications function sees increment or decrement value it pushes the <offset, value> pair
    * to the ZeroModify token.
    * 4. Finally, the index of the LoopStart token is superseded by the ZeroAndModify token, and the rest is altered with Nop.
    */
    pub fn simple_loop_optimization(profiler: &Profiler, tokens: &mut Vec<TokenType>) -> BrainFluxError<()> {
        // Iterate through all simple loops identified by the profiler
        for (start, end) in profiler.get_simple_loops() {
            // Create a vector without Nop tokens
            let loop_tokens: Vec<TokenType> = tokens[*start..=*end]
                .iter()
                .filter(|token| !matches!(token, TokenType::Nop))
                .cloned()
                .collect();
            // If the loop modifies multiple cells, optimize it accordingly
            let modifications = Self::calculate_multi_modifications(&loop_tokens);
            // Replace the first token with ZeroAndModify
            tokens[*start] = TokenType::ZeroAndModify(modifications);
            // Replace the rest of the tokens with Nop
            for i in (*start + 1)..=*end {
                tokens[i] = TokenType::Nop;
            }
        }
        Ok(())
    }
    pub fn memory_scan_optimization(profiler: &Profiler, tokens: &mut Vec<TokenType>) -> BrainFluxError<()> {
        // Iterate through all non-simple loops identified by the profiler
        for (start, end) in profiler.get_non_simple_loops() {
            // Create a vector without Nop tokens
            let loop_tokens: Vec<TokenType> = tokens[*start..=*end]
                .iter()
                .filter(|token| !matches!(token, TokenType::Nop))
                .cloned()
                .collect();
            // Check if the loop_tokens match the pattern {LoopStart, IncrementPointer(n), LoopEnd}
            if loop_tokens.len() == 3 {
                if let (
                    TokenType::LoopStart,
                    TokenType::IncrementPointerN(n),
                    TokenType::LoopEnd
                ) = (&loop_tokens[0], &loop_tokens[1], &loop_tokens[2]) {
                    // Check if n is a power of two
                    if (n.abs() as u32).is_power_of_two() && *n < 16 {
                        // Replace the tokens in the original vector with MemoryScan(n)
                        if loop_tokens[1] == TokenType::DecrementPointerN(*n) {
                            tokens[*start] = TokenType::MemoryScan(-*n);
                        } else {
                            tokens[*start] = TokenType::MemoryScan(*n);
                        }
                        // Nop the rest
                        for i in (*start + 1)..=*end {
                            tokens[i] = TokenType::Nop;
                        }
                    }
                }
            }
        }
        Ok(())
    }
    
    // Function to calculate multiple target modifications
    fn calculate_multi_modifications(loop_tokens: &[TokenType]) -> Vec<(i32, i32)> {
        let mut modifications = Vec::new();
        let mut pointer_offset = 0;
        for token in loop_tokens {
            match token {
                TokenType::IncrementPointerN(n) => pointer_offset += n,
                TokenType::DecrementPointerN(n) => pointer_offset -= n,
                TokenType::IncrementValueN(m) => modifications.push((pointer_offset, *m)),
                TokenType::DecrementValueN(m) => modifications.push((pointer_offset, -*m)),
                _ => {}
            }
        }
        modifications
    }  
    // The following function might be used for various passes in order to avoid accidentally noping
    // Or just matching for certain patterns. For now, it is never called. Initially, I was using it
    // To check simple loops again. Which can be additional overhead for the interpreter.   
    fn _is_zero_and_modify_loop(loop_tokens: &[TokenType]) -> bool {
        matches!(loop_tokens[0], TokenType::LoopStart) &&
        matches!(loop_tokens[1], TokenType::DecrementValueN(1) | TokenType::DecrementPointerN(_) | TokenType::IncrementPointerN(_)) &&
        loop_tokens.iter().any(|t| matches!(t, TokenType::IncrementPointerN(_) | TokenType::DecrementPointerN(_))) &&
        loop_tokens.iter().any(|t| matches!(t, TokenType::IncrementValueN(_) | TokenType::DecrementValueN(_))) &&
        matches!(loop_tokens[loop_tokens.len() - 1], TokenType::LoopEnd)
    }
}