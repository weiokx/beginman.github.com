---
layout: post
title: Kernel, Shell, X-Window
category: linux
---
##一.Kernel: 

Linux内核，最核心部分，负责资源管理与调度。

##二.Shell:

中文意思外壳，是linux命令解释器。功能强大，通过Shell来交互Kernel.我们用的终端就是虚拟Shell,Shell种类有很多,Fedora 12默认的Shell是Bash，Ubuntu也是。

**如何查看自己的linux发行版本用的是什么类型的Shell呢？**

可以这样做，在命令行下输入系统不识别的命令，然后就有提示，如下：

    [beginman@beginman ~]$ linux
    bash: linux: 未找到命令

通过上面的信息我发现我的linux发行版本的Shell种类是bash.

**如何利用Shell查看系统版本和型号：**

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

**总结：**

>User,Shell,Kernel的关系就是用户通过Shell和Kernel交互，Shell用来解释命令传达给kernel,kerner再去执行相关操作，然后执行结果反馈给User.

##三.X-Window
是liunx图形界面，就像使用windows操作系统一般，只不过是linux一个软件。

**总结：**

>x-window仅仅是利用shell来完成少许的工作，它占用太多的内存资源，就比如windows系统用的时间长会很卡。如果要体验Linux真正的高性能和高效率，还是要依靠命令行(Shell环境)

##四.命令控制台






