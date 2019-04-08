#Skills Exercises Tutorial 2 USP
##Exercise 1. Write a script that outputs your name. So if your name is "Joe Smith". The script should echo "Joe Smith" to the screen.

##Exercise 2. Write a script that prompts the user for a name and writes the result to the screen.

##Exercise 3. Write a script that takes one argument and echoes that argument to the screen.

##Exercise 4. Write a script that outputs its own name, the number of arguments past to it and values of all the arguments past to it. Hint, use the $0, $# and $* variables.

##Exercise 5. Write a script call makaexe.sh that takes one argument, a file name. The script should change the file permissions of that file to add user execute permission.

##Exercise 6. Write a script called private.sh that takes one argument, a file name. The script should remove read write and execute permissions from the group and all other users.

##Exercise 7. Write a script call changename.sh that takes two arguments. The first is the file name of an existing file. The second is a new name for the file. The script should use the mv command to change the file's name.

##Exercise 8. Write a script called makallexe.sh that adds execute permissions to all the files ending in ".sh" that exist in its current working directory.

##Exercise 9. Write a script called sum.sh that takes one command line argument which is a file name. The script should display a summary of the named file. It should provide the following data:
* The file's type.
* The file's permissions.
* The number of lines, words and bytes in the file.
* The first 3 lines of the file.
* The last 2 lines of the file.
* Hint, you can use the following commands in the script "file, ls, wc, head, tail."

##Exercise 10. Write a script called worktime2.sh that does the following:

* Runs two xterm windows. Both terminal should have their TERM shell variables set to 'xterm'.
* One of the xterm windows should have its PS1 shell variable set to 'coding$'.
* The other xterm window should have its PS1 shell variable set to 'testing$'.
* The script should then open a web browser on the page 'https://online.uts.edu.au/webapps/login/'.
    Hints Remember a command can be run in the background using the "&" symbol. You can start firefox with the "firefox" command and a url as its first argument.