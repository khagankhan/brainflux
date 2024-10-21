#!/bin/bash

# Description: This script deletes all files that do not have .b, .pl, .dat, or .sh extensions

# Directory to clean (default is current directory)
DIR=${1:-.}

# Find and delete files that are not .b, .pl, .dat, or .sh
find "$DIR" -type f ! \( -name '*.b' -o -name '*.pl' -o -name '*.dat' -o -name '*.sh' \) -delete

echo "Cleanup complete. Files with .b, .pl, .dat, and .sh extensions are kept."

