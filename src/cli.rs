use std::io::{BufRead, BufReader};
use clap::Parser;

pub type BrainFluxError<T> = Result<T, Box<dyn std::error::Error>>;

/// BrainFlux: Yet Another Implementation of the BrainFuck language: Highly optimized version
#[derive(Parser, Debug)]
#[command(version="0.1.0", about="Yet another implementation of BrainFuck programming language", long_about = None)]
pub struct Args {
    /// The source file that contains BrainFlux code
    source_file: String,
    /// The implementation tier that is used
    #[arg(short, long, default_value_t=String::from("interp"))]
    test_target: String,
    /// Print profile information for after execution
    #[clap(long, short)]
    profile: bool,
    /// Do optimization
    #[clap(long, short)]
    optimize: bool,
}
impl Args {
    pub fn open(&self, given_file: &str) -> BrainFluxError<Box <dyn BufRead>> {
        Ok(Box::new(BufReader::new(std::fs::File::open(given_file)?)))
    }
    pub fn get_source_file(&self) -> &String {
        &self.source_file
    }
    pub fn get_test_target(&self) -> &String {
        &self.test_target
    }
    pub fn get_profile(&self) -> bool {
        self.profile
    }
    pub fn get_optimize(&self) -> bool {
        self.optimize
    }
}