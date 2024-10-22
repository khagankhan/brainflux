# BrainFlux
BrainFlux: An optimized implementation of the BrainFuck programming language

## Build and Run
- `git clone https://github.com/khagankhan/brainflux.git`
- `cd brainflux`
- `cargo b --release`
- `/path/to/brainflux/target/release/brainflux /path/to/the/source_file`

## Help

```text
Yet another implementation of BrainFuck programming language

Usage: brainflux [OPTIONS] <SOURCE_FILE>

Arguments:
  <SOURCE_FILE>  The source file that contains BrainFlux code

Options:
  -t, --test-target <TEST_TARGET>  The implementation tier that is used [default: interp]
  -p, --profile                    Print profile information for after execution.
                                   Creates html files as well for simple and nonsimple loops.
                                   To see exact number of executions run under interpreter [default: interp or -t interp]
  -o, --optimize                   Do optimization
  -h, --help                       Print help
  -V, --version                    Print version
```
