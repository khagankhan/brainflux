use brainflux::cli::*;
use brainflux::implementation::*;
fn main() -> BrainFluxError<()> {
    let mut interpreter = Implementation::new();
    interpreter.start()?;
    Ok(())
}