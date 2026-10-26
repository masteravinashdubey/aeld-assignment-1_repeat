#!/bin/sh

if [ "$#" -ne 2 ]; then
    echo "Error: Two arguments are required."
    echo "Usage: $0 <file_path> <string_to_write>"
    exit 1
fi

writefile=$1
writestr=$2

# Create the directory if it doesn't exist
dir=$(dirname "$writefile")
if [ ! -d "$dir" ]; then
    mkdir -p "$dir"
    if [ $? -ne 0 ]; then
        echo "Error: Failed to create directory ${dir}."
        exit 1
    fi
fi

echo "$writestr" > "$writefile"

if [ $? -ne 0 ]; then
    echo "Error: Failed to write to file ${writefile}."
    exit 1
fi

exit 0