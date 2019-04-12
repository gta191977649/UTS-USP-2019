#!/bin/bash
username=$1
# check if the $1 arg is exist
if [ -z $username ]; then
    echo "Usage: ./home.sh username" 2>&1 # redirect the output to the strerror
    exit 1
fi
# use the commands from previous questions, find the input user home
home=`cat /etc/passwd | awk -v user_name=$username 'BEGIN{FS=":"} $1 == user_name {print $7}'`
# notice that the awk -v options can provide a way to construct a variables and subsitues it to the awk command to use
# therefore i don't feel bash is elegant at all, i just hate this technique for doing things, but whatever as long as teacher happy.
# finally to check if the home is empty, if empty, this means this user is not found or not exist
if [ -z $home ]; then
    echo "User: $username home path is not found"
else 
    echo $home
fi
