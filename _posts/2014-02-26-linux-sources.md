---
layout: post
title: Linux 资源技巧汇总
categories: linux
---
##Linux resources
**1.修改linux命令行提示符路径显示**
 >工作路径太长，一行都挤不下了，怎么办？修改环境变量PS1（命令行提示符），可以使用vi编辑~/.bashrc文件，在最后加上：export PS1='[\u@\h \W]\$ '即可。其中\u显示当前用户账号，\h显示当前主机名，\w显示当前完整工作路径（\W显示当前工作路径），\$显示'$'符号。

[See here](http://blog.chinaunix.net/uid-20846214-id-3227969.html)

**2.w3m基于文本的网页浏览器**

[1].In your Ubuntu System, ni must install it.:
	sudo apt-get install w3m

[2].then you can search web.
	w3m http://www.google.com

[more about w3m](http://wiki.ubuntu.org.cn/W3m)

**3.about linux **
[应该知道的Linux技巧](http://coolshell.cn/articles/8883.html)

[你可能不知道的Shell](http://coolshell.cn/articles/8619.html)

[28个Unix/Linux的命令行神器](http://coolshell.cn/articles/7829.html)

[一些鲜为人知的但却很有趣的Unix/Linux命令（五）](http://www.diguage.com/archives/8.html)

[分享一些资料（侧重Linux）](http://www.cnblogs.com/diguage/archive/2013/04/06/3001939.html)
