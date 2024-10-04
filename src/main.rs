use brainflux::cli::*;
use brainflux::implementation::*;
fn main() -> BrainFluxError<()> {
    println!("TODO: Add ZeroAndModify token optimization to the interpreter as well.");
    let mut interpreter = Implementation::new();
    interpreter.start()?;
    Ok(())
}