---
layout: post
title: ubuntu下mysql的那些坑
category: mysql
---
坑很多，很多坑，对于中文到配置可以参考如下：

[1.Ubuntu下MySQL中文乱码解决](http://blog.csdn.net/zht666/article/details/8783396)

[2.再次尝试 用 Mysql 环境搭建 以及 mysql中文乱码完美解决](http://blog.csdn.net/jiacai2050/article/details/11782287)

[3.解决mysql: unrecognized service错误](http://www.ctohome.com/FuWuQi/aa/511.html)

[4.other](http://ubuntuforums.org/showthread.php?t=1811158)

其实最主要到问题就是权限和操作问题，要以root到身份切入，然后修改my.cnf，最后重启mysql:`service mysql restart`

可以参考这里[mysql 默认编码设置](http://hi.baidu.com/weiokx/item/3cbc1d5569b11700e7c4a525)
