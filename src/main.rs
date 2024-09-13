use brainflux::cli::*;
use brainflux::interpreter::*;
fn main() -> BrainFluxError<()> {
    let mut interpreter = Interpreter::new();
    interpreter.start()?;
    Ok(())
}