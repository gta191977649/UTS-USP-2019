1. List all filenames in /bin whose names end with 'a' and save this list to the file 'afiles.txt' in your home directory. Do NOT include the full path of each file, just the filename.
        
        ls /bin | grep -E  "a$" > afile.txt

2. Make a subdirectory in your home directory called 'rcfiles' and copy into it all of the files from /etc whose names end with 'rc'.
    ## 知識分野
    * File Globbing 和 Regex 該什麼時候用
    * 基本文件操作指令Linux  
    ## 解法
        
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

    ## 解法
        cat /etc/profile | grep -Eo "\b[A-Z]*\b" | sort -d
    # 思路
    1. 首先用cat把全部他要的東西顯示出來從用戶的shell profile配置文件
    2. 把這些文件的輸出流pipe到 grep函數裏做過濾。
        * -E 是使用extended regex (這個基本上是常識性的參數,如果不喜歡可以適用egrep指令，同等價)
        * -o 是只顯示匹配到的東西(這個很重要),如果不使用這個參數的話非匹配到的東西也會一同輸出，只不過是匹配到東西會變色，這樣就沒法進行SORT了
    3. 適用sort 指令對匹配到的結果進行排序
        * -h 是dictionary-order，只考慮空白和字母數字字符,其實加不加這個參數都可以，只不過加上感覺更嚴謹點

    ## 知識分野
    * Pipe line
    * 正則表達式(簡單)
    * sort 指令
    * cat 指令

4. The file /etc/passwd contains lines that look like this:

        operator:x:11:0:operator:/root:/sbin/nologin
        games:x:12:100:games:/usr/games:/sbin/nologin
        ftp:x:14:50:FTP User:/var/ftp:/sbin/nologin
        nobody:x:99:99:Nobody:/:/sbin/nologin
    The field delimiter is : and the fields are:

        username:password:userid:groupid:realname:homedirectory:shell
    Come up with a UNIX command that will find and print out the home directory of
    the user whose username is 'root'.
    ## 解法
        # 解法 1 awk 最優雅!
        cat /etc/passwd | awk 'BEGIN{FS=":"} $1=="root" {print $6}'
        # 解法 2 cut +  多從 grep 正則過濾 特別不優雅
        cat /etc/passwd | cut -d : -f1,6 | grep -E "^root:" | grep -Eo "/.+"        
    # 思路
    ## 解法 1
    1. 用 cat 把文件裏的東西全部輸出
    2. 適用awk 過濾信息,直到找到想要的
        * $1 == "root" 就是 只輸出 username == "root" 的情況，和編程語言中的if一樣
    * 關於 awk 的高級用法
        http://www.runoob.com/linux/linux-comm-awk.html
    ## 解法 2
    這個方法稍微複製了點，但是理論上不會awk的情況快也可以完全用grep解出這道題
    1. 用 cat 把文件裏的東西全部輸出 (廢話)
    2. 通過cut 按照 ":" 切分字符
    3. 因爲 cut 切分字符的時候，會連着分隔符都print出來，也就是":"符號，所以得到的格式是 username:home,因此後面的思路就是構造正則去只匹配 root:[這裏是題目要的部分] 這樣的內容
    4. 適用第一個 grep,先從這堆username裏面找出root的那行，所以直接上 "^root:" 意思是找出任何行按照root:開頭的，這行：後面的內容就一定是我們想要的。
    5. 因爲一個grep不能把:後面的內容取出來，但是目前我們已經定位到了要找的內容了，所以還要在上一個正則把 "^root:"開頭後面的內容提取出來就是我們要的結果了，所以用 "/.*\b"
    意思是從"/"符號開頭，一路匹配到低就是我們要找的完整路徑
        * 至於 grep -o 是幹嘛的，這個options的意思是只顯示出匹配到的路徑，因爲題目對userhome前面的東西完全不感興趣


5. Come up with a UNIX command that will print a sorted, unique list of all of the different shells used by the different users in /etc/passwd.
    ## passwd 格式 (參考用)
        username:password:userid:groupid:realname:homedirectory:shell
    ## 解法
        # 解1 (awk方法)
        cat /etc/passwd | awk 'BEGIN{FS=":"} {print $7}' | sort -u
        # 解2 (cut方法) 更優雅
        cat /etc/passwd | cut -d : -f7 | sort -u
    # 思路
    1. 首先和之前一樣，還是把他要的東西全部cat出來
    2. 用任何字符分割方法，cut,awk等，切分出shell字符(在這格式下一個是偏移量的第7個)
    3. 用sort函數進行排序,並加上 -u 選項,該選項是表示unique list,作用是把重複的結果給無視掉，只會輸出一個
    # 知識分野
    * 切割指令 cut, awk 等
    * pipe
    * sort 函數
6. Come up with a UNIX command that will print a list of usernames from /etc/passwd that end with a vowel.
    # 解法
        # 解1 (awk+grep)
        cat /etc/passwd | awk 'BEGIN{FS=":"} {print $1}' | grep -E "[aeiou]$"
        # 解2 (cut+grep) 最優雅
        cat /etc/passwd | cut -d : -f1 | grep -E "[aeiou]$"
    # 思路
    1. 適用cat指令吧全部內容顯示出來 (好套路啊我都快玩膩了orz), pipe這坨屎到字符切割指令
    2. 使用任何文件切割指令，把你感興趣部分的東西單獨摘出來,在這裏username所以是$1,摘出感興趣的東西後在pipe到grep去
    3. 用grep 或者 egrep 之類的字符文本搜索指令通過正則查找aeiou結尾的東西,也就是 [aeiou]$ 
    # 知識分野
    * cat
    * 文件分割指令
    * 正則表達式
    * pipe

7. The 'env' command prints out all of the environment variables and their values. Come up with a command that prints a list of environment variables whose names end with either 'NAME', 'DIR' or 'PATH'.
    # 解法
        env | grep -E "(NAME|PATH|DIR)\b"
    # 思路
    1. 老套路pipe env的STDOUT到 grep或者egrep 裏面
    2. 用正則表達式找出全部詞依照NAME|PATH|DIR結尾的,所以這裏用的是 "搜索詞\b"
        * \b 是word boundary, 在這裏是表示任何詞的最後的位置
        * 所以 (NAME|PATH|DIR)\b 表示的是 任何詞到結尾之前必須要有這3個其中的任意一個，即按照這3個任意一個結尾
    # 知識分野
    * pipe
    * 文件分割指令
    * 正則表達式
8. Write a script called 'home.sh' which takes a username as its argument and will print out the home directory of that user as follows:

        $ ./home.sh root
        root's home directory is /root
        $ ./home.sh nobody
        nobody's home directory is /
    If the command is used incorrectly, print a usage error to stderr:

        $ ./home.sh
        Usage: ./home.sh username
    ## 解法
    * 見 q_8.home.sh 文件
9. Write a script called big which takes a filepath as an argument. The script should print "Big" if the file is more than 1000 bytes or "Small" if the file is less than 1000 bytes. If exactly one argument was not given, print "Error" to stderr.
    ## 解法
    * 見 q_9_big.sh 文件
10. Using the metric system, where 1 kilobyte = 1000 bytes, write a script that takes a filename as an argument and prints out the file size in kilobytes by dividing the number of bytes by 1000.
    ## 解法
    * 見 q_10.sh 文件