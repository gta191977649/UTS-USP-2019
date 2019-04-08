#!/bin/bash
# read -p "enter the filename: " filename
filename=$1
newname=$2
# check file exists
if [ -e "$filename" ]; then
    # check if newname is empty or null
    if [ ! -z "$newname" ]; then
        mv $filename $newname
        echo "file $filename is changed name to $newname"
    else 
        echo "the new filename cannot be null"
    fi
else 
    echo "Sorry file $filename is not exist!"
fi