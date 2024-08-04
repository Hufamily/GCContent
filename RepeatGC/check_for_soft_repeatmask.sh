#!/bin/bash

# Directory containing .fna files
directory="./"

# Iterate through each .fna file in the directory
for file in $directory/*.fna; do
    # Check if the file exists and is readable
    if [ -f "$file" ] && [ -r "$file" ]; then
        # Extract the filename without the path
        filename=$(basename "$file")

        # Use grep to search for nucleotide sequences outside of header lines
        if grep -v '^>' "$file" | grep -qi '[atgc]'; then
            echo "File $filename contains masked nucleotide sequences outside of header lines."
        else
            echo "File $filename does not contain masked nucleotide sequences outside of header lines."
        fi
    fi
done