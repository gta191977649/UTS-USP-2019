#!/bin/bash
filename=$1
# first check whatever file is exisit
if [ -e "$filename" ]; then 
        echo "file type:\t ${filename##*.}"
        permission=$(ls -lr | grep $filename)
        echo "file permissions:\n $permission"
        lines=$(wc -l $filename)
        words=$(wc -w $filename)
        bytes=$(wc -c $filename)
        echo "bytes: $bytes"
        echo "lines: $lines"
        echo "words: $words"
        echo "first 3 char:"
        head -n 3 $filename
        echo "last 2 line:"
        tail -n 2 $filename
    else 
        echo "sorry, file name $filename is not exist!"
fi
echo "\n"