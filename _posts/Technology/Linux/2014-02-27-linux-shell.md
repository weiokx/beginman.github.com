---
layout: post
title: Kernel, Shell, X-Window
category: Linux
tags: Linux
description: Linux学习，Kernel, Shell, X-Window
---
##一.Kernel: 

Linux内核，最核心部分，负责资源管理与调度。

##二.Shell:

中文意思外壳，是linux命令解释器。功能强大，通过Shell来交互Kernel.我们用的终端就是虚拟Shell,Shell种类有很多,Fedora 12默认的Shell是Bash，Ubuntu也是。

###如何查看自己的linux发行版本用的是什么类型的Shell呢？

可以这样做，在命令行下输入系统不识别的命令，然后就有提示，如下：

    [beginman@beginman ~]$ linux
    bash: linux: 未找到命令

通过上面的信息我发现我的linux发行版本的Shell种类是bash.

###如何利用Shell查看系统版本和型号

1.cat /etc/issue

2.lsb_release -a

    [beginman@beginman ~]$ cat /etc/issue
    Ubuntu 13.04 \n \l
    
    [beginman@beginman ~]$ lsb_release -a
    No LSB modules are available.
    Distributor ID:	Ubuntu
    Description:	Ubuntu 13.04
    Release:	13.04
    Codename:	raring
    [beginman@beginman ~]$ 
    
3.查看系统位数 ： uname -m, 或者uname-a

    [beginman@beginman ~]$ uname -a
    Linux beginman 3.8.0-35-generic #50-Ubuntu SMP Tue Dec 3 01:25:33 UTC 2013 i686 athlon i686 GNU/Linux
    [beginman@beginman ~]$ uname -m
    i686
如果带有*86说明是32位，如果是x86_64说明是64位。

###总结

>User,Shell,Kernel的关系就是用户通过Shell和Kernel交互，Shell用来解释命令传达给kernel,kerner再去执行相关操作，然后执行结果反馈给User.

##三.X-Window
是liunx图形界面，就像使用windows操作系统一般，只不过是linux一个软件。

>x-window仅仅是利用shell来完成少许的工作，它占用太多的内存资源，就比如windows系统用的时间长会很卡。如果要体验Linux真正的高性能和高效率，还是要依靠命令行(Shell环境)

##四.命令控制台

Linux终端也称为虚拟控制台，是从Uinx继承来的。Linux提供了6个控制台(或称虚拟终端)，对应的设备文件是：`/dev/tty1~6`,进入Linux后当前使用的是tty0终端，如果使用图形界面工作方式(x-window)则在第七个虚拟终端上。虚拟控制台让linux成为一个真正的多用户操作系统。

应用：

1.开启和切换其他控制台

一般桌面版如Ubuntu默认启动系统是以图形界面(x-window)启动的，它本身占用了tty1,所以我们可以开启tty2~tty6的控制台，开启的快捷键:`Ctrl+Alt+Fn(2~6)`,进入控制台后可以`Alt+Fn(2~6)`在这些控制台中切换。当我们进入终端后也可以输入`tty` 查看自己所在的哪号终端，输入`tty3`进入三号终端;如果想回到图形界面则，输入`tty7` 或者快捷键`Alt+F7`，或者`Ctrl+Alt+F7`返回图形界面。下面的命令很有用：

    [root@localhost~]# startx       # 退出终端回到图形界面，此终端将不存在
    [root@localhost~]# startx &     # 退出终端回到图形界面，这个终端还在后台运行
    


##参考

1.[Linux中tty、pty、pts的概念区别](http://www.readfree.net/htm/200908/4786353.html)

2.《Linux操作系统教程-实训与项目案例》






