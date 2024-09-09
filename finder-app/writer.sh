#!/bin/bash

# Check if the correct number of arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Error: You must provide exactly two arguments: a file path and a string to write."
    exit 1
fi

# Assign arguments to variables
writefile=$1
writestr=$2

# Create the directory path if it doesn't exist
mkdir -p "$(dirname "$writefile")"

# Create the file and write the string to it, overwriting any existing file
echo "$writestr" > "$writefile"

# Check if the file was created successfully
if [ $? -ne 0 ]; then
    echo "Error: The file '$writefile' could not be created."
    exit 1
fi

echo "File '$writefile' created successfully with the provided content."
