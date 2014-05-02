---
layout: post
title: Linux学习二：对文件及文件夹常用操作
category: Linux
tags: Linux
description: Linux学习，  对文件及文件夹常用操作
---
##一.Linux一切皆文件的哲学
>“一切皆是文件”是 Unix/Linux 的基本哲学之一。不仅普通的文件，目录、字符设备、块设备、 套接字等在 Unix/Linux 中都是以文件被对待；它们虽然类型不同，但是对其提供的却是同一套操作界面。

![](http://www.ibm.com/developerworks/cn/linux/l-cn-vfs/2.jpg)

基于此，在学习Linux过程中，我把方向调整过来里，先从基点出发，然后先后延伸，这个基点也就是Linux的文件管理系统了。

##二.文件的操作

###1.路径

Linux文件系统呈现树形结构

    sudo apt-get install tree
    $ tree
    .
    ├── 404.html
    ├── archives.html
    ├── atom.xml
    ├── bat.bat
    ├── CNAME
    ├── _config.yml
    ├── contact.html
    ├── css
    │   └── style.css
    ├── _drafts
    │   └── django-unit-test.md
    ├── favicon.ico
    ├── font
    │   ├── fontawesome-webfont.eot
    ├── github.sh
    ├── images
    │   └── yujinxiang.jpeg
    ├── index.html
    ├── js
    │   ├── html5.js
    │   ├── jquery.js
    │   ├── jquery.scrollTo.js
    │   ├── prettify
    │   │   ├── lang-apollo.js
    │   │   ├── lang-basic.js
    │   └── theOne.js
    ├── _layouts
    │   ├── default.html
    │   └── post.html

上面呈现了多么高大的树形结构啊，接下来要从路径开始入手才能渐渐深入Linux文件系统。

>`/` :根目录（入口）

>`.` :当前目录

>`..` :当前目录的上级目录

>`~` :用户自己的主目录

>`USER` :用户名为USER的主目录（这里就是其他用户的目录了）

###2.ls

>`ls -al` 列出详尽

>`ls -a[--all]`: 列出所有，包括隐藏文件

>`ls -l -R` :列出详尽，同时列出所有子目录层

    ls -l -R
    ./images:
    总用量 156
    -rw-rw-r-- 1 beginman beginman 158177  4月 29 12:56 yujinxiang.jpeg
    
    ./js:
    总用量 112
    -rw-rw-r-- 1 beginman beginman  2002  4月 29 12:56 html5.js
    -rw-rw-r-- 1 beginman beginman 93876  4月 29 12:56 jquery.js
    -rw-rw-r-- 1 beginman beginman  8007  4月 29 12:56 jquery.scrollTo.js
    drwxrwxr-x 2 beginman beginman  4096  4月 29 12:56 prettify
    
    ./js/prettify:
    总用量 188
    -rw-rw-r-- 1 beginman beginman   988  4月 29 12:56 lang-apollo.js
    ....
    
关于ls 更多内容可以可[参考这里](http://www.cnblogs.com/peida/archive/2012/10/23/2734829.html)
    
    
###3.mv 移动或重命名

>-b ：若需覆盖文件，则覆盖前先行备份。 

>-f ：force 强制的意思，如果目标文件已经存在，不会询问而直接覆盖；

>-i ：若目标文件 (destination) 已经存在时，就会询问是否覆盖！

>-u ：若目标文件已经存在，且 source 比较新，才会更新(update)

    mv dir1 dir2   # 如果目录dir2不存在，将目录dir1改名为dir2；否则，将dir1移动到dir2中。
    mv * ../           # 移动当前文件夹下的所有文件到上一级目录
    mv dir_a/*.txt dir_b   # 把当前目录的一个子目录里的文件移动到另一个子目录里
    
###4.cp复制

cp [选项]... [-T] 源 目的

参数：

>-a:保留链接/文件属性并复制其子目录，其作用等同dpr选项组合。

>-d:复制时保留链接

>-f:强制删除已存在的目标文件而不提示

>-i:已存在则交互式提示

>-p:将修改时间，权限也复制进去。

>-r:如果源文件是目录文件则递归复制该目录下所有东东到目标目录里。

###5.rm 删除文件或目录

rm [ 选项] [文件或目录]

参数如下：

>-f, --force    强制删除

>-i, --interactive 进行交互式删除

>-r, -R, --recursive   指示rm将参数中列出的全部目录和子目录均递归地删除。

>-v, --verbose    详细显示进行的步骤

    $ rm b
    rm: 无法删除"b": 是一个目录
    rm -rf  b ：将 b 目录及子目录中所有档案删除,并且不用一一确认
    
###6.touch 创建空文件或更改文件时间

touch [选项] [文件]

参数如下：

>-a   或--time=atime或--time=access或--time=use 　只更改存取时间。

>-c   或--no-create 　不建立任何文档。

>-d 　使用指定的日期时间，而非现在的时间。

>-f 　此参数将忽略不予处理，仅负责解决BSD版本touch指令的兼容性问题。

>-m   或--time=mtime或--time=modify 　只更改变动时间。

>-r 　把指定文档或目录的日期时间，统统设成和参考文档或目录的日期时间相同。

>-t 　使用指定的日期时间，而非现在的时间。

    # 创建多个空文件
    $ touch a.txt b.txt c.txt
    # 不创建文件
    $ touch -c d.txt 
    # 指定文档或目录(如下b.txt)的日期时间，统统设成和参考文档或目录(如下c.txt)的日期时间相同。
    -rw-rw-r--  1 beginman beginman    0  5月  2 10:55 b.txt
    -rw-rw-r--  1 beginman beginman    0  5月  2 10:54 c.txt
    $ touch b.txt c.txt 
    -rw-rw-r--  1 beginman beginman    0  5月  2 11:01 b.txt
    -rw-rw-r--  1 beginman beginman    0  5月  2 11:01 c.txt
    # 设定指定时间
    $ touch -t 201405021115.30 a.txt     # 2014年5月2日11点15分30秒
    -rw-rw-r-- 1 beginman beginman 0  5月  2 11:15 a.txt


-t  time 使用指定的时间值 time 作为指定文件相应时间戳记的新值．此处的 time规定为如下形式的十进制数:      
 
  [[CC]YY]MMDDhhmm[.SS]     
  
这里，CC为年数中的前两位，即”世纪数”；YY为年数的后两位，即某世纪中的年数．如果不给出CC的值，则touch   将把年数CCYY限定在1969--2068之内．MM为月数，DD为天将把年数CCYY限定在1969--2068之内．MM为月数，DD为天数，hh 为小时数(几点)，mm为分钟数，SS为秒数．此处秒的设定范围是0--61，这样可以处理闰秒．这些数字组成的时间是环境变量TZ指定的时区中的一个时 间．由于系统的限制，早于1970年1月1日的时间是错误的。

###7.cd 进入目录

cd [目录名]

    #使用 cd 命令进入当前用户主目录
    $ cd   # 效果同 cd ~
    
    #返回上次所在的目录
    $ cd -
    
    #把上个命令的参数作为cd参数使用
   $ cd ..     # 上次cd 的参数 ..  进入到用户主目录
    ---- [Time]:11:24:55     [User]:beginman     [Dir]:~ ----
    $ cd !$  # 把上个cd命令参数 .. 拿来使用 则进入到 /home
    cd ..      # 相当于再用户主目录下又执行里 cd ..
    ---- [Time]:11:25:04     [User]:beginman     [Dir]:/home ----

###8.mkdir创建目录

前提：1/有写入的权限;  2/目录下不能创建已存在的目录

语法：mkdir [选项] [dirname]

参数：

>-m ,--mode：设定权限

>-p, --parents：可以是一个路径名称。此时若路径中的某些目录尚不存在,加上此选项后,系统将自动建立好那些尚不存在的目录,即一次可以建立多个目录

>-v, --verbose：显示创建信息

实例：

    # 创建空目录
    $ mkdir dir_a
    
    # 创建多个目录
    $ mkdir -p dir_a/dir_b/dir_c
    $ tree
    .
    └── dir_a
        └── dir_b
            └── dir_c
            
    #创建权限为777的目录
    $ mkdir -m 777 dir_d
    drwxrwxrwx  2 beginman beginman 4096  5月  2 15:40 dir_d
    
    # 创建多级目录并输出信息
    $ mkdir -v -p a/b/c/d
    mkdir: 已创建目录 "a"
    mkdir: 已创建目录 "a/b"
    mkdir: 已创建目录 "a/b/c"
    mkdir: 已创建目录 "a/b/c/d"
    

###9.rmdir 删除空目录

前提：1/有写的权限; 2/ 必须是空目录

语法：rmdir [option] [dirname]

参数：

>- p ,--parents 递归删除目录dirname，当子目录删除后其父目录为空时，也一同被删除。如果整个路径被删除或者由于某种原因保留部分路径，则系统在标准输出上显示相应的信息。 如：'rmdir -p a/b/c' is similar to 'rmdir a/b/c a/b a'

>-v, --verbose  显示指令执行过程 

实例：

    ---- [Time]:03:48:33     [User]:beginman     [Dir]:~/test/dir_d ----
    $ tree
    .
    └── a
        └── b
            └── c
                └── d
    
    4 directories, 0 files
    ---- [Time]:03:48:38     [User]:beginman     [Dir]:~/test/dir_d ----
    $ cd a/b/c/d/
    ---- [Time]:03:48:47     [User]:beginman     [Dir]:~/test/dir_d/a/b/c/d ----
    $ cd ../../../../
    ---- [Time]:03:48:57     [User]:beginman     [Dir]:~/test/dir_d ----
    $ rmdir -p a/
    rmdir: 删除 "a/" 失败: 目录非空
    $ rmdir -p a/b/c/d/  # 删除里a/b/c/d

注意：rm - r dir(删除文件或目录) 命令可代替rmdir,但不建议使用，原因如下：

    $ rmdir a  # 提示
    rmdir: 删除 "a" 失败: 目录非空
    $ rm -r a  # 不管你是否非空，不提示直接删除。 


###10.cat 查看文件内容

语法：cat [OPTION]... [FILE]...

参数：

 - A, --show-all 
 
 -b, --number-nonblank 

注意：

>1.cat filename : filename必须存在

>2.cat > filename 只能创建新文件,不能编辑已有文件.

>3.将几个文件合并为一个文件:cat file1 file2 > file

>4.cat filename |more  分屏显示


实例：
    
    # 输出并显示行号
    $ cat -b ma6174_vim_setup.sh 
     1	#!/bin/bash
     2	echo "安装将花费一定时间，请耐心等待直到安装完成^_^"
     3	if which apt-get >/dev/null; then
     .....
     
     

##参考：
[从文件 I/O 看 Linux 的虚拟文件系统](http://www.52rd.com/Blog/Detail_RD.Blog_imjacob_17246.html)

[每天一个linux命令（9）：touch 命令](http://www.cnblogs.com/peida/archive/2012/10/30/2745714.html)