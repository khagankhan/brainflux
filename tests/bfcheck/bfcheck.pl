#!/usr/bin/perl -w

# NOTE: This tests have been provided by Prof. Dr. John Regehr. The outputs refer to his implementation.
# If you see the bug in the reference implementation please let me know.

use strict;
my @bfs = glob "prog-*.b";

# when the run() function is called, you should interpret, or else
# compile and run, the BF file that is named by the function
# argument. It should read from input.dat and write to output.dat,
# which are both files in the current directory. output.dat is a new
# file that should be created (overwriting any existing file by that
# name) and input.dat is a file that you should assume already exists.

sub run {
    (my $f) = @_;
    # Get base filename without the extension
    $f =~ /^(prog-\d+)\.b$/;
    my $base = $1;
    # Run the compiler to generate assembly and binary
    print "Compiling $f to assembly...\n";
    system("../../target/release/brainflux -t arm64 $f");
    # Check if assembly was generated
    die "Assembly generation failed for $f\n" unless -f "output.s";
    # Move the generated assembly to the correct filename
    system("mv output.s $base.s");
    # Compile the assembly to binary
    print "Compiling $base.s to binary...\n";
    system("gcc $base.s -o $base");
    # Ensure the binary is executable
    system("chmod +x $base");
    # Run the binary with input.dat and redirect output to output.dat
    print "Running $base with input.dat...\n";
    system("./$base < input.dat > output.dat 2>/dev/null");
}

my $success = 0;
my $fail = 0;
# Iterate over all BF files and run them
foreach my $f (@bfs) {
    print "$f\n";
    die unless $f =~ /^prog-([0-9]+)\.b$/;
    my $num = $1;
    # Run the compilation and execution
    run($f);
    # Compare the output with the expected output
    my $res = system("diff output.dat output-$num.dat");
    if ($res == 0) {
        ++$success;
    } else {
        ++$fail;
        print("\tfailed.\n");
    }
}
print("\n\n$fail failures, $success successes\n\n");
