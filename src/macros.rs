#[macro_export]
macro_rules! profile_if {
    ($print_profiler:expr, $count_vector:expr, $interpreter:expr, $tokens:expr) => {
        if $print_profiler {
            Profiler::do_profile(&mut $count_vector, $interpreter.pp, 
                $interpreter.token_to_char(&$tokens[$interpreter.pp]));
        }
    };
}
