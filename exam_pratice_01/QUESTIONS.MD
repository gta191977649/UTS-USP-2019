1. List all filenames in /bin whose names end with 'a' and save this list to the file 'afiles.txt' in your home directory. Do NOT include the full path of each file, just the filename.
        
        ls /bin | grep -E  "a$" > afile.txt

2. Make a subdirectory in your home directory called 'rcfiles' and copy into it all of the files from /etc whose names end with 'rc'.
    ## 知識點
    * File Globbing 和 Regex 該什麼時候用
    * 基本文件操作指令Linux  
    ## Solution
        
        mkdir rcfiles # 創建文件夾
        cd rcfiles/ #進入 rcfiles 文件夾
        cp /etc/*rc ./ #複製任意依rc結尾的文件到當面目錄(rcfiles文件夾),注意這裏是找文件所以應該用文件名通配  (File Globbing) 方法

3. The file /etc/profile contains the default initialisation options for your shell.
    Produce a unique list of all variables with uppercase names that have been set
    in /etc/profile sorted in alphabetical order.

    On the UTS Linux lab machines, the output should be:

        EUID
        HISTCONTROL
        HISTSIZE
        HOSTNAME
        LOGNAME
        MAIL
        PATH
        UID
        USER
    ## 知識點
    * Pipe line
    * 正則表達式(簡單)
    * sort 指令
    * cat 指令
    ## Solutions
        cat /etc/profile | grep -Eo "\b[A-Z]*\b" | sort -d
        # 思路
        1. 首先用cat把全部他要的東西顯示出來從用戶的shell profile配置文件
        2. 把這些文件的輸出流pipe到 grep函數裏做過濾。
            * -E 是使用extended regex (這個基本上是常識性的參數,如果不喜歡可以適用egrep指令，同等價)
            * -o 是只顯示匹配到的東西(這個很重要),如果不使用這個參數的話非匹配到的東西也會一同輸出，只不過是匹配到東西會變色，這樣就沒法進行SORT了
        3. 適用sort 指令對匹配到的結果進行排序
            * -h 是dictionary-order，只考慮空白和字母數字字符,其實加不加這個參數都可以，只不過加上感覺更嚴謹點


4. The file /etc/passwd contains lines that look like this:

        operator:x:11:0:operator:/root:/sbin/nologin
        games:x:12:100:games:/usr/games:/sbin/nologin
        ftp:x:14:50:FTP User:/var/ftp:/sbin/nologin
        nobody:x:99:99:Nobody:/:/sbin/nologin
    The field delimiter is : and the fields are:

        username:password:userid:groupid:realname:homedirectory:shell
    Come up with a UNIX command that will find and print out the home directory of
    the user whose username is 'root'.
    ## Solution
        # 解法 1 awk
        cat /etc/passwd | awk 'BEGIN{FS=":"} $1=="root" {print $6}'
        # 解法 2 grep + 正則
        ...
        # 思路
        關於 awk 的高級用法
        http://www.runoob.com/linux/linux-comm-awk.html

5. Come up with a UNIX command that will print a sorted, unique list of all of the different shells used by the different users in /etc/passwd.

6. Come up with a UNIX command that will print a list of usernames from /etc/passwd that end with a vowel.

7. The 'env' command prints out all of the environment variables and their values. Come up with a command that prints a list of environment variables whose names end with either 'NAME', 'DIR' or 'PATH'.

8. Write a script called 'home.sh' which takes a username as its argument and will print out the home directory of that user as follows:

        $ ./home.sh root
        root's home directory is /root
        $ ./home.sh nobody
        nobody's home directory is /
    If the command is used incorrectly, print a usage error to stderr:

        $ ./home.sh
        Usage: ./home.sh username

9. Write a script called big which takes a filepath as an argument. The script should print "Big" if the file is more than 1000 bytes or "Small" if the file is less than 1000 bytes. If exactly one argument was not given, print "Error" to stderr.

10. Using the metric system, where 1 kilobyte = 1000 bytes, write a script that takes a filename as an argument and prints out the file size in kilobytes by dividing the number of bytes by 1000.
