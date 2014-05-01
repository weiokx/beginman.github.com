---
layout: post
title: Linux Bash 高亮美化
category: linux
---
未配置的终端不够友好，且如果进入到目录过多过长则会产生一长串的命令符，很烦人。通过一下几种配置后，终端立马高大上里。

以下是我的终端显示：

![](http://beginman.qiniudn.com/bash)

我的配置查看如下：

export PS1="---- [Time]:\[\033[1;35m\]\T     \[\033[0m\][User]:\[\033[1;33m\]\u     \[\033[0m\][Dir]:\[\033[1;32m\]\w\[\033[0m\] ----\n\$ "


##推荐配置如下

**1.修改linux命令行提示符路径显示:**

工作路径太长，一行都挤不下了，怎么办？修改环境变量PS1（命令行提示符），可以使用vi编辑~/.bashrc文件，在最后加上：`export PS1='[\u@\h\W]\$ '`即可，其中\u显示当前用户账号，\h显示当前主机名，\w显示当前完整工作路径（\W显示当前工作路径），\$显示'$'符号。

**2.给终端加笑脸**

正确的命令则显示笑脸^_^，错误的命令则显示O_O。

PS1="\`if [ \$? = 0 ]; then echo \[\e[33m\]^_^\[\e[0m\]; else echo \[\e[31m\]O_O\[\e[0m\]; fi\`[\u@\h:\w]\\$ "


效果如下：

![](http://beginman.qiniudn.com/bash1)

**3.无效命令的变色处理**

当输入无效的命令，或者运行失败，可以变个颜色处理下。

效果如下：(前面数字显示第N条命令，如果输入命令无效则变红)

![](http://beginman.qiniudn.com/bash2)

**4.多行提示**

PS1="\n\[\033[35m\]\$(/bin/date)\n\[\033[32m\]\w\n\[\033[1;31m\]\u@\h: \[\033[1;34m\]\$(/usr/bin/tty | /bin/sed -e 's:/dev/::'): \[\033[1;36m\]\$(/bin/ls -1 | /usr/bin/wc -l | /bin/sed 's: ::g') files \[\033[1;33m\]\$(/bin/ls -lah | /bin/grep -m 1 total | /bin/sed 's/total //')b\[\033[0m\] -> \[\033[0m\]"

效果与我的终端效果类似。

##参考
[8 Useful and Interesting Bash Prompts](http://www.maketecheasier.com/8-useful-and-interesting-bash-prompts/)








