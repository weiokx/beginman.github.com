---
layout:post
title:git多账户
category:git
---
##一.原理问题
###1.git config
在初次运信git，会运行git-config命令（一个叫做 git config 的工具），专门用来配置或读取相应的工作环境变量。这些变量可以存放在以下三个不同的地方：

>/etc/gitconfig 文件：系统中对所有用户都普遍适用的配置。若使用 git config 时用 --system 选项，读写的就是这个文件。

>~/.gitconfig 文件：用户目录下的配置文件只适用于该用户。若使用 git config 时用 --global 选项，读写的就是这个文件。

>当前项目的 git 目录中的配置文件（也就是工作目录中的 .git/config 文件）：这里的配置仅仅针对当前项目有效。每一个级别的配置都会覆盖上层的相同配置，所以 .git/config 里的配置会覆盖 /etc/gitconfig 中的同名变量。

###2.ssh config
linux下可以`man ssh_config`查看文档。

如果对于git多账户登录而言，用的都是ssh方式登录，那么在多个ssh登录的情景下就要设置ssh config了，先了解一些ssh config对以后的配置有很大的帮助：

**1.位置**

一般存放在`~/.ssh/config`，如果没有可以新建一个。

**2.格式**

config格式如下：

    Host 名称(自己决定，方便输入记忆的)
        HostName 主机名
        User 登录的用户名

如果有公司自己的git服务器，则可以这样写：

    HostName 服务器地址
    User 登录用户名
    Port 29418
    ……
        
如果是github这样注意的是：

    Host github.com
    HostName github.com
    User git
   
github默认的主机名:github.com;默认的用户：git.

##二.配置git多账户
###1.两个github帐号：
这里参考这我的篇博客[git初体验（七）多账户的使用](http://www.cnblogs.com/BeginMan/p/3548139.html)

###2.一个github账户，一个git其他服务器账户
比如一些公司内部的git服务器，如我的配置如下：
    
    #公司内部git服务器
    Host tbktcn #随笔起名吧
    HostName XXX.255.XXX.XXX    #服务器地址
    Port 29418                  #端口
    User fangpeng  #我大号：方朋  #用户名
    IdentityFile /home/beginman/.ssh/id_rsa   #对应公司的私钥
    
    #github
    Host git
    HostName github.com
    User git
    IdentityFile /home/beginman/.ssh/id_rsa_my  #自己github私钥
    
这样就配置Ok了，那么测试一下吧：

    [beginman@beginman .ssh]$ ssh -T git@github.com
    Warning: Permanently added the RSA host key for IP address '192.30.252.129' to the list of known hosts.
    Hi BeginMan! You've successfully authenticated, but GitHub does not provide shell access.

    ssh -T fangpeng@tbktcn
    
      ****    Welcome to Gerrit Code Review    ****
    
      Hi 方朋, you have successfully connected over SSH.
    
      Unfortunately, interactive shells are disabled.
      To clone a hosted Git repository, use:
    
      git clone ssh://fangpeng@XXX.255.XXX.XX:29418/REPOSITORY_NAME.git

`git -T User@Host`

##推荐阅读：

[1.5 起步 - 初次运行 Git 前的配置](http://git-scm.com/book/zh/%E8%B5%B7%E6%AD%A5-%E5%88%9D%E6%AC%A1%E8%BF%90%E8%A1%8C-Git-%E5%89%8D%E7%9A%84%E9%85%8D%E7%BD%AE)

[使用SSH CONFIG](http://www.lainme.com/doku.php/blog/2011/01/%E4%BD%BF%E7%94%A8ssh_config)

[Multiple SSH Keys settings for different github account](https://gist.github.com/jexchan/2351996)

[Multiple github accounts on the same computer?](http://stackoverflow.com/questions/3860112/multiple-github-accounts-on-the-same-computer)

