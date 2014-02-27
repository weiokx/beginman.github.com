---
layout: post
title: git全局配置
category: git
---
**1.如何查看全局配置**

全局配置生成在`/etc/gitconfig`文件中，可以打开查看。或者用如下命令:
    $ git config --list
 
**2.全局帐号配置**

    $ git config --global user.name "John Doe"
    $ git config --global user.email johndoe@example.com

**3.别名配置**

在linux下使用svn，自动给你提示了它的别名，如svn up == svn update；svn st == svn status等等，那么git也能进行别名配置，我的git配置如下：

    $ git config --global alias.st status
    $ git config --global alias.ci commit
    $ git config --global alias.co checkout
    $ git config --global alias.br branch
    $ git config --global alias.ps push
    $ git config --global alias.pl pull
    $ git config --global alias.unstage 'reset HEAD'   # 表示拉回的未暂存
    $ git config --global alias.last 'log -1'           # 表示查看最后一次提交历史
    # 下面表示智能个性化log查看
    
$ git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
    
**4.查看帮助**

    git config --help
    
**5.设置默认git编辑器**

    git config --global core.editor emacs
    
**6.设置主题颜色**

    git config --global color.ui true   
    

*参考：*

1.[Customizing Git - Git Configuration](http://git-scm.com/book/en/Customizing-Git-Git-Configuration) 

2.[配置别名](http://www.liaoxuefeng.com/wiki/0013739516305929606dd18361248578c67b8067c8c017b000/001375234012342f90be1fc4d81446c967bbdc19e7c03d3000)


  

