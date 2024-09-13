use assert_cmd::Command;
use predicates::prelude::*;

type TestResult = Result<(), Box<dyn std::error::Error>>;

// Should print Usage when no argument is given
#[test]
fn error_no_source_file() -> TestResult {
    let mut cmd = Command::cargo_bin("brainfuck")?;
    cmd.assert()
        .failure()
        .stderr(predicate::str::contains("Usage: brainfuck <SOURCE_FILE>"));
    Ok(())
}

#[test]
fn run_with_argument() -> TestResult {
    let mut cmd = Command::cargo_bin("brainfuck")?;
    cmd.arg("tests/expected/empty.bf")
        .assert()
        .success();
    Ok(())
}