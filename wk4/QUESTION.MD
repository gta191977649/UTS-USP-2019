tele 
# Skills Exercises Tutorial 4 USP
## Exercise 1.  Pick a file and print every line that contains a comment.
    grep "#" box.sh

## Exercise  2.  Pick a few files and use grep to print every line within them that contains both code and a comment.
    grep "#" *
## Exercise  3.  Run the command 'head -1 *'.  You'll notice that it prints out the first line of every file.  This can be useful if we have a bunch of scripts and we want to make sure they are pointing to the right interpreter.  The problem is,  it has listed non script files as well.  Can you think of a way we could modify the command above to make it better?  You could use file globbing ie 'head -1 *.sh' however as we know,  unix is an extensionless system so scripts may not necessarily have a '.sh' extension.  Instead I would like you to use grep and come up with an expression that will print the first line but only if it is the path to an interpreter (note:  it could be the path to any interpreter,  not just /bin/bash.)
    head -1 * | grep '#!/\w\+/\w\+\?'

## Exercise  4.  Within the script towers.sh we can see that several variables have been set that control the overall behavior of the script.  Those variables have been set as all uppercase.  We would like to see how those variables have been used throughout the script.  First off use grep to print every line of towers.sh which contains a word which is all uppercase.  Now see if you can extend this into two commands,  the first of which prints only lines where the variable is being used and the second of which prints only lines where the variable is being set.
### Print every line of towers.sh which contains a word which is all uppercase:
    grep -E "\b[A-Z]+\b" towers.sh
    (note: \b is match for words boundaries)
### Extend this into two commands
    (2 Command是什麼鬼?)
    解1:
    cat towers.sh | grep -n -E "\b[A-Z]+\b" 
    解2 (更簡潔):
    grep -n -E "\b[A-Z]+\b towers.sh
    解3 (最有可能符合他題目的字面意思但是不最優雅):
    grep -n -E "\b[A-Z]+\b" towers.sh; grep -E "\b[A-Z]+\b" towers.sh

## Exercise 5.  One of these scripts is printing data to a logfile called '/root/backup.log'  Your aim is to identify which one it is.  Your command should only print the name of the file to the screen.  (hint:  there may be a command line option for grep that can help)
    grep -E -l "/root/backup.log" *
## Exercise  6.  There are different command line options that can be used to modify the behaviour of grep.  Remember where you can find these?  You are going to need some of these.  First off I would like you to use one of these options to print every line of x that does not contain a space.  Now I would like you to use another option as well to list every one of these bash scripts that contains a line without a space on it.
    grep -v " " *

## Exercise  7.  homework.sh is an interesting script.  Run it then have a look at the code.  You'll probably notice that it is fairly cryptic.  Looking at the code it would be very hard to figure out what it is doing.  Print out every line which contains a '[' followed by a character followed by a ']'.  Now modify it to print only lines that contain a '[' followed by a digit followed by a ']'.  (note:  you may have to escape certain characters.)
    grep -E "\\[.\\]" homework.sh 
    Note: '\\' for escape (順便吐曹下bash的轉義真奇葩)
## Exercise  8.  Do a search for all lines in stopwatch.sh which contain the string '()'.  This will give us 7 lines of output.  One of them is the odd one out however.  We are now going do do a search for every line in stopwatch.sh which contains characters,  followed by '()', followed by 0 or more spaces,  followed by '{'.  This will leave us with some interesting output.  Any idea what these may be?  (You haven't learnt about them but if you're interested then Google is your friend,  or ask your tutor)
    grep -E "\\(\\) * {" stopwatch.sh
    Note: 這一看就是搜函數麼？ 還用咕鴿啥呢 =w=

## Exercise  9.  You will remember from a previous tutorial we can do mathematical expressions in bash.  Use grep to print a report of how many times a mathematical expression is carried out in each script.  (note:  some of greps command line arguments may come in useful)
    grep -E -c '\(\(.+\)\)' *
## Exercise  10.  Here are two regular expressions.  See if you can figure out what they are going to match: (Think about how you are going to do this.  Think about how you could break it up.  Think about what sample data you may run through it to test your theories.)
    
    /\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/   
    任何一個詞彙之間 : [A-Z或者0-9或者.,_,%,+-]的字符至少出現1,n次 @
    (看起來像是郵箱)
    
    /(19|20)\d\d[- /.](0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])/ 
    19或20 數字 數字 -或者/或者.
    https://regexper.com/#%20%2819%7C20%29%5Cd%5Cd%5B-%20%2F.%5D%280%5B1-9%5D%7C1%5B012%5D%29%5B-%20%2F.%5D%280%5B1-9%5D%7C%5B12%5D%5B0-9%5D%7C3%5B01%5D%29
## Exercise 11.  Bonus challenge.
    The script petals.sh gives you a puzzle.  See if you can figure out the solution.  Try to solve it without looking at the code however if you do get really stuck then analyse the code.
    (Tips: 看看篩子圖像)
## Exercise  12.  Bonus Challenge.
    Play about with the gameoflife.sh script and data file.  Read the comments at the top of the file to understand what is going on.  (Wikipedia also has some useful material on this).  Now play about with some different datafiles and see if you can create a population that is steady and a population that has rapid growth.



