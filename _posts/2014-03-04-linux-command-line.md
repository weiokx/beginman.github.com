---
layout: post
title: linux常用命令和技巧
category: linux
---
##一.Bash Shell 快捷键
可以查看这里[**让你提升命令行效率的 Bash 快捷键**](https://linuxtoy.org/archives/bash-shortcuts.html),但是有一点的上，复制粘贴快捷上面没有，这里补充下：

>`Shift+Ctrl+C`:复制当前光标选择的内容

>`Shift+Ctrl+V`:粘贴当前光标选择的内容

>`ctrl+u`:剪切光标之前的内容，不包括当前字符

>`ctrl+k`:剪切光标之后的内容，包括自身

>`ctrl+w`:剪切光标之前的一个词

>`alt+d`:剪切光标之后的一个词

>`ctrl+y`:粘贴当前剪切数据

**重在自己要多加运用，孰能生巧。**

##二.常用命令

**注意：以下命令最好`man` 查看文档**

**1.执行多个命令：**

`;`分割多条命令，如：`date;ls`

**2.date**

`date`显示时间，`date +%m/%y` 显示自定义格式的时间

**3.系统介绍**

    hostname - show or set the system's host name
    domainname - show or set the system's NIS/YP domain name
    ypdomainname - show or set the system's NIS/YP domain name
    nisdomainname - show or set the system's NIS/YP domain name
    dnsdomainname - show the system's DNS domain name

**4.clear**

清屏，或`ctrl+l`

**5.history**

显示系统历史命令列表，我这上面显示了2千多条，最近记录显示在往下的历史命令中。**!命令编号，执行对应的命令**

**6.touch创建文件**

如果文件存在则修改其更改时间为当前时间。

**7.df**

查看文件系统信息，包括设备文件名/空间使用/挂载目录，默认以KB表示磁盘空间的使用情况，`df -m`则以MB为单位。

**8.env**

显示环境变量

**9.ps查看进程**

**10.whoami:查看当前用户，who查看所有用户**

**11.su切换用户**

`su root` 切换到root用户，如果提示“su：认证失败”，可以参考这篇文章[**su认证失败解决方法**](http://www.9streets.cn/art-php-228.html)

**12.grep过滤信息**,[linux grep命令](http://www.cnblogs.com/end/archive/2012/02/21/2360965.html)

##三.小技巧

参考这里：

[**你可能不知道的Shell**](http://coolshell.cn/articles/8619.html)

如果你对命令行特别感兴趣，还可以这篇文章：非常拉轰

[**28个Unix/Linux的命令行神器**](http://coolshell.cn/articles/7829.html)

[**酷壳**](http://coolshell.cn/articles/4722.html)这是牛逼的网站阿，在上面你能学到很多！

看看这个吧，太令人吃惊了[**在Web上运行Linux**](http://coolshell.cn/articles/4722.html)

看了下面的文章，你会发现linux命令行的强大与高效:

[**你用Linux命令行吗？**](http://coolshell.cn/articles/1256.html)



