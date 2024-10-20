use brainflux::cli::*;
use brainflux::implementation::*;
fn main() -> BrainFluxError<()> {
    let mut implementation = Implementation::new();
    implementation.start()?;
    Ok(())
}