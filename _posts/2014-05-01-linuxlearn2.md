---
layout: post
title: Linux学习二：对文件及文件夹常用操作
category: linux
---
##一.Linux一切皆文件的哲学
>“一切皆是文件”是 Unix/Linux 的基本哲学之一。不仅普通的文件，目录、字符设备、块设备、 套接字等在 Unix/Linux 中都是以文件被对待；它们虽然类型不同，但是对其提供的却是同一套操作界面。

![](http://www.ibm.com/developerworks/cn/linux/l-cn-vfs/2.jpg)

基于此，在学习Linux过程中，我把方向调整过来里，先从基点出发，然后先后延伸，这个基点也就是Linux的文件管理系统了。

##二.文件的操作

**1.路径**

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

**2.ls**

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
    
**3.mv 移动或重命名**

>-b ：若需覆盖文件，则覆盖前先行备份。 

>-f ：force 强制的意思，如果目标文件已经存在，不会询问而直接覆盖；

>-i ：若目标文件 (destination) 已经存在时，就会询问是否覆盖！

>-u ：若目标文件已经存在，且 source 比较新，才会更新(update)

    mv dir1 dir2   # 如果目录dir2不存在，将目录dir1改名为dir2；否则，将dir1移动到dir2中。
    mv * ../           # 移动当前文件夹下的所有文件到上一级目录
    mv dir_a/*.txt dir_b   # 把当前目录的一个子目录里的文件移动到另一个子目录里
    
**4.cp复制**

cp [选项]... [-T] 源 目的

参数：

>-a:保留链接/文件属性并复制其子目录，其作用等同dpr选项组合。

>-d:复制时保留链接

>-f:强制删除已存在的目标文件而不提示

>-i:已存在则交互式提示

>-p:将修改时间，权限也复制进去。

>-r:如果源文件是目录文件则递归复制该目录下所有东东到目标目录里。





关于ls 更多内容可以可[参考这里](http://www.cnblogs.com/peida/archive/2012/10/23/2734829.html)



##参考：
[从文件 I/O 看 Linux 的虚拟文件系统](http://www.52rd.com/Blog/Detail_RD.Blog_imjacob_17246.html)
