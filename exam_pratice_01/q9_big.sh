#!/bin/bash
filepath=$1
# Check if the file path is exit and the command is provided
if [ ! -f $filepath ] || [ ! $# -eq 1 ]; then 
	echo "Error file not exist" 2>&1
	exit 1
fi
# there are multible way to archive check filesize
# you can ether use wc or ls, howerver i think in here wc is most elegant way of doing this.
filesize=`wc -c < $filepath`
# notice < in there will make the wc treat the filepath as the stdin rather than from file, so this is the trick to get rid of the filesize in bytes only.

#compare the file size
if [ $filesize -gt 1000 ]; then
	echo "Big"
else
	echo "Small"
fi
