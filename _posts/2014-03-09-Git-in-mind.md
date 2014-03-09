---
layout: post
title: Git
category: git
---
##一、前奏
我一直认为如下：

>1.凡是记忆性的问题都不是问题！

>2.凡是钱能解决的事情都不叫事情！

如果你曾大致了解了Git这一门技术，你会发现这是属于“记忆型”的，所以，这门技术对我们来说不是问题，是一门熟能生巧的哲学。

有了这个前奏之后，我想您比我更加知道该如何去掌握它。

以下内容纯属个人总结，为了不让这篇总结显得唐突，我会结合以下思维导图一一开展：

![](http://images.cnblogs.com/cnblogs_com/BeginMan/486940/o_gitFlow.jpg)

##二、准备工作

###1.git配置:

**[1].菜单的了解**

windows下安装了msmygit，鼠标右键继承了Git客户端的一些命令选项，如下：

![](http://images.cnblogs.com/cnblogs_com/BeginMan/486940/o_gitInitTool.jpg)

(在非git仓库目录下鼠标右键的菜单栏)

`Git Init Here`:初始化一个git仓库

`Git Gui`:打开Git图形客户端

`Git Bash`:打开Git的bash环境(模拟Linux,这里要使用linux命令，win命令无效)

![](http://images.cnblogs.com/cnblogs_com/BeginMan/486940/o_gitTool.jpg)

(在git仓库目录下的鼠标右键的菜单栏)

`Git Add all files now`:相当于`git add --all`表示将所有改动或添加拉倒暂存区中。

`Git Commit Tool`:打开git图形客户端，图形化提交。

`Git History`:打开gitk图形客户端查看历史记录，也可使用`$ gitk`命令打开。图片如下：

![](http://images.cnblogs.com/cnblogs_com/BeginMan/486940/o_gitk.jpg)

*个人建议：通过gitk图形客户端查看日志更加抽象直观！*

`Git Branch`:显示分支状态，如图我的项目中暂时只有一个master主分支。


**[2].客户端配置**

No1.复制粘贴：

在windows下打开Bash环境后，如何复制粘贴：

在git bash客户端头部右键，选择|“属性”，然后把“快速编辑模式勾选即可” 如下图：

![](http://images.cnblogs.com/cnblogs_com/BeginMan/489381/o_set_git2.jpg)

No2.中文乱码问题



