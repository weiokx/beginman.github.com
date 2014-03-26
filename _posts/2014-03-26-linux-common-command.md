---
layout: post
title: Linux命令札记
category: linux
---
##一.linux命令
Linux 系统的在线求助 `man page` 和 `info page`,man手册页（manual pages，“手册”），是类UNIX系统最重要的手册工具。多数类UNIX都预装了它.

语法：

    man 手册名
    

man page常用按键在[鸟哥的Linux私房菜 基础学习篇](http://pan.baidu.com/s/1sjvvq7j)NO5上面，可以查阅

**man 手册小结：**
>1.要明白[1~7]数字所代表的含义。

>2.掌握Man page 中的快捷键

>3.`man -f 要查询的关键字` 来显示所有包含这个关键字的信息

>比如说`man -f git` 查询关于git信息:

    [beginman@beginman man]$ man -f git
    git (1)              - the stupid content tracker
    Git (3pm)            - Perl interface to the Git version control system
    # 有可能它存在很多地方，如1,2,3...等，要查看指定则如下：
    [beginman@beginman man]$ man 1 git
    # man man 与 man 1 man 的结果相同
    # man git 等同于 man 1 git
 
>4.`man -k 关键字`显示说明文件含有该关键字的信息，不一定是完整的字符串.

>5.whatis [指令或者是数据] <==相当于 man -f [指令或者是数据]

>6.apropos [指令或者是数据] <==相当于 man -k [指令或者是数据]

需要注意如果使用`whatis`或`apropos`，需要以root身份建立whatis数据库才行：`[root#..]#makewhatis`

**注意：**

linux指令背不完，最好的方式就是记住常用的指令，对于不常用的则通过man 查询。比如打印`lp`,先 `lp[tap]`看看有没有对应的，如果没有再 `lp[tab][tab]` 输出关于lp全部指令，然后找自己想要的指令，最后`man 想要的指令`查看具体说明。



**推荐阅读：[Man Page (简体中文)](https://wiki.archlinux.org/index.php/Man_Page_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87))**

## 二.命令札记
1.`date`查看linux系统时间

    [beginman@beginman ~]$ date
    2014年 03月 26日 星期三 14:41:46 CST
    [beginman@beginman ~]$ date +%Y/%m/%d
    2014/03/26
    
2.`cal`显示日历

格式：`cal [month][year]`


    [beginman@beginman ~]$ cal
          三月 2014         
    日 一 二 三 四 五 六  
                       1  
     2  3  4  5  6  7  8  
     9 10 11 12 13 14 15  
    16 17 18 19 20 21 22  
    23 24 25 26 27 28 29  
    30 31       
    
3.`bc`计算器，退出用`quit`命令

4.`关机重启`(更多内容鸟哥私房菜)

![](http://images.cnblogs.com/cnblogs_com/BeginMan/486940/o_linux_shutdown.png)

重启：`reboot`/`halt`/`poweroff`

重启命令可以使用:

    [root@www~]#sync;sync;sync;reboot



      
    