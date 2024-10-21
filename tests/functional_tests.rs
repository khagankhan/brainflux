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
fn run_interp_with_argument() -> TestResult {
    let mut cmd = Command::cargo_bin("brainflux")?;
    cmd.arg("tests/functionaltesting/expected/empty.bf")
        .assert()
        .success();
    Ok(())
}
#[test]
fn hello_world_interp() -> TestResult {
    run(vec!["tests/functionaltesting/expected/hello.bf"], "Hello World!".to_string())?;
    Ok(())
}
#[test]
fn benches_ok() -> TestResult {
    run(vec!["tests/functionaltesting/expected/bench.b"], "OK".to_string())?;
    Ok(())
}
#[test]
fn profiler_interpreter() -> TestResult {
    let expected = fs::read_to_string("tests/functionaltesting/outputs/loop_profiler.txt")?;
    run(vec!["-p", "tests/functionaltesting/expected/loop_profiler.bf"], expected)?;
    Ok(())
}
// ARM64 Compiler tests:
#[test]
fn run_arm64_with_argument() -> TestResult {
    let mut cmd = Command::cargo_bin("brainflux")?;
    cmd.args(vec!["--test-target", "arm64", "tests/functionaltesting/expected/empty.bf"])
        .assert()
        .success();
    Ok(())
}
#[test]
fn hello_world_optimized_arm64() -> TestResult {
    let expected = fs::read_to_string("tests/functionaltesting/outputs/hello_optimized.s")?;
    let mut cmd = Command::cargo_bin("brainflux")?;
    cmd.args(vec!["--test-target", "arm64", "tests/functionaltesting/expected/hello.bf"]);
    let generated = fs::read_to_string("./hello.s")?;
    assert_eq!(expected, generated);
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