---
layout: post
title: ubuntu下mysql的那些坑
category: mysql
---
坑很多，很多坑，对于中文到配置可以参考如下：
###Fuck, mysql on Ubuntu. 

当我修改mysql中文乱码到时候，以root身份切入然后修改my.cnf,设置编码未utf8然后保存，再重启`service mysql restart` ，也无法重启，然后就进不去Mysql,报错如下：

>ERROR 2002 (HY000): Can't connect to local MySQL server through socket '/var/run/mysqld/mysqld.sock' (2)'''

Fuck,我重装里N遍了。

###Maybe.

[1.Ubuntu下MySQL中文乱码解决](http://blog.csdn.net/zht666/article/details/8783396)

[2.再次尝试 用 Mysql 环境搭建 以及 mysql中文乱码完美解决](http://blog.csdn.net/jiacai2050/article/details/11782287)

[3.解决mysql: unrecognized service错误](http://www.ctohome.com/FuWuQi/aa/511.html)

[4.other](http://ubuntuforums.org/showthread.php?t=1811158)

可以参考这里[mysql 默认编码设置](http://hi.baidu.com/weiokx/item/3cbc1d5569b11700e7c4a525)
