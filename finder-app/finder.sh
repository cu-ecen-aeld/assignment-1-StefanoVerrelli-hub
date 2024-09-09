#!/bin/bash

# Check if the correct number of arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Error: You must provide exactly two arguments: a directory path and a search string."
    exit 1
fi

# Assign arguments to variables
filesdir=$1
searchstr=$2

# Check if filesdir is a valid directory
if [ ! -d "$filesdir" ]; then
    echo "Error: The specified path '$filesdir' is not a directory."
    exit 1
fi

# Count the number of files in the directory and subdirectories
num_files=$(find "$filesdir" -type f | wc -l)

# Count the number of matching lines in those files
num_matching_lines=$(grep -r -c "$searchstr" "$filesdir" | awk -F: '{sum += $2} END {print sum}')

# Print the results
echo "The number of files are $num_files and the number of matching lines are ${num_matching_lines:-0}"

