##linux档案权限和目录配置的简单介绍
###一.使用者与群组
Linux最优秀的地方之一就是其多人多任务工作环境，一台主机有可能有很多人同时使用，因此对档案数据就要好好保密了，所以档案可存取身份分为三个类别：owner/group/other,各有read/write/execute权限。

>档案拥有者就是以单个Linux用户为单位，分别管理自己的一块东西。

>群组的概念就是以一个Team为单位，Team里面有很多Classmembers.每个群组管理自己的东西。

>那么Other就是拥有者的相对一面了。

>**注意最大的使用者就是Root了。**

所有系统上的账号和一般使用者，还有root的相关信息存放在/etc/passwd案内；个人密码存放在/etc/shadow档案内；群组存放在/etc/group内。

##二.linux文件属性
可以通过`li -al` 查看具体的文件属性。（这里我们最好以root身份登录)

    root@beginman:/# ls -al
    总用量 104
    drwxr-xr-x  23 root root  4096  4月 29 21:49 .
    drwxr-xr-x  23 root root  4096  4月 29 21:49 ..
    drwxr-xr-x   2 root root  4096  4月 28 20:05 bin
    drwxr-xr-x   3 root root  4096  4月 28 20:02 boot
    drwxrwxr-x   2 root root  4096  4月 29  2013 cdrom
    drwx------   2 root root  4096  4月 29 22:24 Desktop
    drwxr-xr-x  17 root root  4220  4月 30 21:46 dev
    drwxr-xr-x 140 root root 12288  4月 30 22:23 etc
    drwxr-xr-x   3 root root  4096  4月 29  2013 home
    [1]-   [2]-[3]-[4][5]    [6]    [7]
    
 上述数字分别代表：
 [1]:权限
 [2]:连结
 [3]:拥有者 


