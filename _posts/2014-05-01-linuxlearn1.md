##linux档案权限和目录配置的简单介绍
###一.使用者与群组
Linux最优秀的地方之一就是其多人多任务工作环境，一台主机有可能有很多人同时使用，因此对档案数据就要好好保密了，所以档案可存取身份分为三个类别：owner/group/other,各有read/write/execute权限。

>档案拥有者就是以单个Linux用户为单位，分别管理自己的一块东西。

>群组的概念就是以一个Team为单位，Team里面有很多Classmembers.每个群组管理自己的东西。

>那么Other就是群组成员相对于非群组成员了。

>**注意最大的使用者就是Root了。**

所有系统上的账号和一般使用者，还有root的相关信息存放在/etc/passwd案内；个人密码存放在/etc/shadow档案内；群组存放在/etc/group内。

##二.linux文件属性
可以通过`ls -al` 查看具体的文件属性。（这里我们最好以root身份登录)

![](http://beginman.qiniudn.com/linux-file-sys)

###[1].代表档案的类型与权限

![](http://beginman.qiniudn.com/linux-type)

第1栏中共有10个字符，第一个字符可分如下：

档案类型：

`d`:表示目录

`-`：表示档案

`|`: 表示连结档（link file）

`b`：表示装置文件里可供存储的接口设备

`c`：表示装置文件里的串行端口设备。如鼠标键盘

**接下来的9个字符，三个为一组，均以[rwx]三个位置参数组合，这三个位置参数分别表示读/写/执行，如果没有则以[-]取代; 那么这三组分别表示：档案所有者的权限/档案所属组的权限/其他人的权限。**

实例：

>[-rwxr-xr--]: 依照上面的，先分割第一个字符[-]:表示档案，然后再将剩下9个字符平均分割三份，[rwx]/[r-x]/[r--],分别表示对档案拥有者可读写执行/对档案拥有者所在的组可读和执行但不能写入/对其他人只可读。

###[2].表示连结
表示有多少个档名连结到此节点(i-node)。每个档案都会将他的权限和属性记录到文件系统的 i-node 中。

###[3].表示拥有者帐号

###[4].表示所属群组

###[5].表示文件大小（bytes）

###[6].表示创建和修改日期，`ls -l --full-time` 显示出更全的日期时间。

###[7].名称，如果之前多一个`.` 表示隐藏文件

##三.修改文件属性和权限

`chgrp`: 改变档案所属群组

`chown`:改变档案拥有者

`chmod`:改变档案权限，SUID,SGID,SBIT等特性。

###1.chgrp
chgrp就是change group的缩写，用来改变档案所属的群组，要改变的群组名必须在/etc/group中存在，否在会报错，语法如下：

![](http://beginman.qiniudn.com/chgrp)

我们可以查看/etc/group的内容，选定一个组来练练手。

    root@beginman:/home/beginman# cat /etc/group
    root:x:0:
    daemon:x:1:
    bin:x:2:
    sys:x:3:
    adm:x:4:syslog,beginman
    tty:x:5:
    disk:x:6:
    .....
    root@beginman:/home/beginman# >test.txt                                  # 新建一个文件
    root@beginman:/home/beginman# ls -al test.txt                           # 查看该文件的属性
    -rw-r--r-- 1 root root 0  5月  1 15:33 test.txt                                    
    root@beginman:/home/beginman# chgrp users test.txt                # 将之前的root组改成users组  
    root@beginman:/home/beginman# ls -al test.txt 
    -rw-r--r-- 1 root users 0  5月  1 15:33 test.txt
    root@beginman:/home/beginman# rm test.txt 

###2.chown
chown就是change owner的缩写，用来改变档案的拥有者，同上要改变的拥有者必须在/etc/passwd 文件中存在。

![](http://beginman.qiniudn.com/chown)

除上之外，也可以用句点符号表示：

    chown 拥有者.组名  filename # 同 拥有者:组名，不够前者容易出现歧义（如组名中如果含有小数点），故推荐后者
    chown .组名  filename # 只修改组名， 同 chgrp 组名 filename
    
    root@beginman:/home/beginman# chown .users test.txt 
    root@beginman:/home/beginman# ls -al test.txt 
    -rw-r--r-- 1 beginman users 0  5月  1 15:38 test.txt
    root@beginman:/home/beginman# chown root.root test.txt 
    root@beginman:/home/beginman# ls -al test.txt 
    -rw-r--r-- 1 root root 0  5月  1 15:38 test.txt

**使用情景：**

root复制文件给jack,但是由于复制行为（`cp`）会复制执行者的属性和权限，所以对jack而言这个复制品还是属于root的，jack无法全权掌握，所以这个时候执行者要更改复制品的拥有者和组名里。

    root@beginman:/home/beginman# cp test.txt test_copy.txt
    root@beginman:/home/beginman# ls -al test_copy.txt 
    -rw-r--r-- 1 root root 0  5月  1 15:52 test_copy.txt

###3.chmod
chmod就是change mode的缩写，用来更改权限。**权限的设定方法分为两种：数字和符号**。

**1.数字：**

*通过上面的学习，知晓Linux的权限共有9个，分别对应owner/group/other 的r/w/x*，用数字表示为：

>`r`:4
 
>`w`:2

>`x`:1

每种身份(owner/group/other)三个权限(r/w/x)数字是累加的，如[-rwxrw-r--]可表示如下：

[rwx]-->owner: 4+2+1 = 7

[rw-]-->group: 4+2+0=6

[r--]-->other: 4+0+0=4

所以该文件的权限数字表示为 764。

通过数字法修改文件权限语法如下：

![](http://beginman.qiniudn.com/chmod1)

实例如下：

![](http://beginman.qiniudn.com/chmodTest)

常常我们以 vim 编辑一个 shell 的文字批处理文件后,他的权限通常是 -rw-rw-r-- 也就是 664, 如果要将该档案变成可执行文件,并不要其他人修改此档案的话, 那就需要-rwxr-xr-x 这样的权限,此时就得要下达:[chmod 755 test.sh ]。

**2.符号**

符号表示法，就是用`u/g/o`来表示user/group/other三种身份权限，`a`代表all,就是全部身份权限，语法如下：

![](http://beginman.qiniudn.com/chmodC)

实例：

    root@beginman:/home/beginman# ls -al test.txt 
    -rw------- 1 root root 0  5月  1 16:10 test.txt
    
    # 设定 user (u):具有可读、可写、可执行的权限; group(g)读写，other(o)只读
    root@beginman:/home/beginman# chmod u=rwx,g=rw,o=r test.txt  
    root@beginman:/home/beginman# ls -al test.txt 
    -rwxrw-r-- 1 root root 0  5月  1 16:10 test.txt
    
    # 设定 user (u):具有可读、可写、可执行的权限; group(g)读写，other(o)读写
    root@beginman:/home/beginman# chmod u=rwx,go=rw test.txt  
    
    # 将执行权限去掉而不更改其他已存在的权限
    root@beginman:/home/beginman# chmod a-x test.txt 
    root@beginman:/home/beginman# ls -al test.txt 
    -rw-rw-r-- 1 root root 0  5月  1 16:10 test.txt


##三.参考
[1.鸟哥Linux私房菜]

[2.Linux 文件属性](http://www.cnblogs.com/kaituorensheng/archive/2013/03/26/2983573.html)


