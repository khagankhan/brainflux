use crate::cli::*;
use crate::implementation::*;
pub struct Optimize;

impl Optimize {
    pub fn pre_process_optimize(tokens: &mut Vec<TokenType>, optimize: bool) -> BrainFluxError<()>{
        if optimize {
            Self::zero_cell(tokens)?;
            Self::sum_increment_decrements(tokens)?;
        }
        Ok(())
    }
    fn zero_cell(tokens: &mut Vec<TokenType>) -> BrainFluxError<()> {
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
        Ok(())
    }
    fn sum_increment_decrements(tokens: &mut Vec<TokenType>) -> BrainFluxError<()>{
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

}