---
layout: post
title: 关于Github访问慢，不能加载css、js解决办法
categories: Jekyll
---

这篇Blog参考性的总结

**方法如下：**
##1.Windows

首先要修改host，推荐用批处理方法：
>1、把下面的代码写入txt文件，并另存为“hosts.bat”文件(这里注意一下，如果有些朋友的电脑是不显示文件后缀的，这样直接命名没效，要在文件夹选项中显示常用文件的后缀)。文件内容如下:

    @echo off
    del %systemroot%\system32\drivers\etc\hosts
    echo 127.0.0.1 www.test.com>>%systemroot%\system32\drivers\etc\hosts

>通过 www.ipaddress.com  这个网站查询github.global.ssl.fastly.net的IP地址，然后在hosts中增加一条。

>2、把里面的IP和域名更改成自己想要的，如github对应的：
    
    #fix github cdn problem because of GFW
    185.31.17.184  github.global.ssl.fastly.net

>3、右键点击”hosts.bat”文件，选择以管理员权限运行。即可

##2.Linux

	[beginman@beginman ~]$ vi /etc/hosts

add it:     185.31.17.184   github.global.ssl.fastly.net 

My hosts:

	[beginman@beginman ~]$ cat /etc/hosts
	127.0.0.1	localhost
	127.0.1.1	beginman
	185.31.17.184   github.global.ssl.fastly.net 
	# The following lines are desirable for IPv6 capable hosts
	::1     ip6-localhost ip6-loopback
	fe00::0 ip6-localnet
	ff00::0 ip6-mcastprefix
	ff02::1 ip6-allnodes
	ff02::2 ip6-allrouters



**参考：**

[http://www.cnblogs.com/fanyong/p/3489800.html](http://www.cnblogs.com/fanyong/p/3489800.html)

[http://jingyan.baidu.com/article/9faa72317903f1473c28cb01.html](http://jingyan.baidu.com/article/9faa72317903f1473c28cb01.html)

[Linux操作系统下/etc/hosts文件配置方法](http://os.51cto.com/art/200803/68170.htm)