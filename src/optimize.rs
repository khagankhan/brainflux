use crate::cli::*;
use crate::implementation::*;
pub struct Optimize;

impl Optimize {
    pub fn pre_process_optimize(tokens: &mut Vec<TokenType>, optimize: bool) -> BrainFluxError<()>{
        if optimize {
            Self::sum_increment_decrement_values(tokens)?;
            Self::sum_increment_decrement_pointers(tokens)?;
            Self::zero_cell(tokens)?;
        }
        Ok(())
    }
    fn zero_cell(tokens: &mut Vec<TokenType>) -> BrainFluxError<()> {
        let count_len = tokens.len();
        let mut index = 0;
    
        while index < count_len.saturating_sub(2) {
            // Skip Nop and ZeroCell tokens
            if tokens[index] == TokenType::Nop {
                index += 1;
                continue;
            }
    
            if let (Some(current_char), Some(next_char), Some(next_next_char)) = (
                tokens.get(index),
                tokens.get(index + 1),
                tokens.get(index + 2),
            ) {
                // Only recognize patterns that do not include Nop or ZeroCell
                if *current_char == TokenType::LoopStart 
                    && (*next_char == TokenType::IncrementValue || *next_char == TokenType::DecrementValue ||
                        *next_char == TokenType::IncrementValueN(1) || *next_char == TokenType::DecrementValueN(1)) 
                    && *next_next_char == TokenType::LoopEnd 
                {
                    tokens[index] = TokenType::ZeroCell;
                    tokens[index + 1] = TokenType::Nop;
                    tokens[index + 2] = TokenType::Nop;
                }
            }
            
            index += 1;
        }
        Ok(())
    }    
    fn sum_increment_decrement_pointers(tokens: &mut Vec<TokenType>) -> BrainFluxError<()>{
        let mut increment_pointer = 0;     // For consecutive IncrementValue tokens
        let mut decrement_pointer = 0;     // For consecutive DecrementValue tokens
    
        let mut increment_pointer_start: Option<usize> = None;  // Track the first IncrementValue index
        let mut decrement_pointer_start: Option<usize> = None;  // Track the first DecrementValue index

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
                TokenType::Nop => {},
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

}