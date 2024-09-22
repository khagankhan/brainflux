use assert_cmd::Command;
use predicates::prelude::*;
use std::fs;

type TestResult = Result<(), Box<dyn std::error::Error>>;

#[test]
fn error_no_source_file() -> TestResult {
    let mut cmd = Command::cargo_bin("brainflux")?;
    cmd.assert()
        .failure()
        .stderr(predicate::str::contains("Usage: brainflux <SOURCE_FILE>"));
    Ok(())
}
#[test]
fn run_with_argument() -> TestResult {
    let mut cmd = Command::cargo_bin("brainflux")?;
    cmd.arg("tests/expected/empty.bf")
        .assert()
        .success();
    Ok(())
}
#[test]
fn hello_world() -> TestResult {
    run(vec!["tests/expected/hello.bf"], "Hello World!".to_string())?;
    Ok(())
}
#[test]
fn profiler_interpreter() -> TestResult {
    let expected = fs::read_to_string("tests/outputs/loop_profiler.txt")?;
    run(vec!["-p", "tests/expected/loop_profiler.bf"], expected)?;
    Ok(())
}

fn run(source_file: Vec::<&str>, expected_output: String) -> TestResult { 
    let mut cmd = Command::cargo_bin("brainflux")?;
    cmd.args(source_file)
        .assert()
        .success()
        .stdout(predicate::str::contains(expected_output));
    Ok(())
}