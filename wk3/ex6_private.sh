#!/bin/bash
# read -p "enter the filename: " filename
filename=$1
echo $filename
# check file exists
if [ -e "$filename" ]; then
    chmod u-rwx,o-rwx $filename
    echo "file $filename is changed permissions to "
    ls -lr | grep $filename
else 
    echo "Sorry File is not exist!"
fi