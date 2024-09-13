use std::io::{BufRead, BufReader};
use clap::Parser;

pub type BrainFluxError<T> = Result<T, Box<dyn std::error::Error>>;

/// BrainFlux: Yet Another Implementation of the BrainFuck language: Highly optimized version
#[derive(Parser, Debug)]
#[command(version, about, long_about = None)]
pub struct Args {
    /// The source file that contains BrainFlux code
    pub source_file: String,
}
impl Args {
    pub fn open(&self, given_file: &str) -> BrainFluxError<Box <dyn BufRead>> {
        Ok(Box::new(BufReader::new(std::fs::File::open(given_file)?)))
    }
}