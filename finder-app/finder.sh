#!/bin/sh

if [ "$#" -ne 2 ]; then
    echo "Error: Two arguments are required."
    echo "Usage: $0 <directory_path> <search_string>"
    exit 1
fi

# Assign arguments to descriptive variable names
filesdir=$1
searchstr=$2

if [ ! -d "$filesdir" ]; then
    echo "Error: Directory ${filesdir} does not exist."
    exit 1
fi

num_files=$(find "$filesdir" -type f | wc -l)
num_matching_lines=$(grep -r "$searchstr" "$filesdir" | wc -l)

echo " The number of files are ${num_files} and the number of matching lines are ${num_matching_lines}"
exit 0