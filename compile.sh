#!/bin/bash

# Check if an argument is provided
if [ $# -eq 0 ]; then
    echo "No file provided."
    exit 1
fi

# Store the current directory where the script is executed
current_directory=$(pwd)
input_file="$1"
base_name="${input_file##*/}"  # Extracts only the filename, discarding the path
base_name="${base_name%.*}"    # Removes the extension

# Run the compiler to generate the assembly file
echo "Generating assembly for $input_file using brainflux"
./target/release/brainflux -t arm64 --optimize "$input_file"

# Check if the expected assembly file 'output.s' was generated
if [ ! -f "output.s" ]; then
    echo "Assembly generation failed. 'output.s' not found."
    exit 1
fi

# Move and rename the output.s to the appropriate base name in the current directory
mv output.s "$current_directory/$base_name.s"

# Compile the assembly file to a binary in the current directory
echo "Compiling $current_directory/$base_name.s to $current_directory/$base_name"
gcc "$current_directory/$base_name.s" -o "$current_directory/$base_name" -O3

chmod +x "$current_directory/$base_name"

echo "Compilation complete. Binary created at: $current_directory/$base_name"

