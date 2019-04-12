#!/bin/bash
filename=$1

if [ ! -f $filename ] || [ ! $# -eq 1 ]; then
    echo "ERROR file not exist" 2>&1
    exit 1
fi
sizeInBytes=`wc -c < $filename`
# calculate the kb /1000
echo "$((sizeInBytes/1000))kb"
# well look at the god damn double bracket $((var calculations)) is that elegant compare to other programming language ? 