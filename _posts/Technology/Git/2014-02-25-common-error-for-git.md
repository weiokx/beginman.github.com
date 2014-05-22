---
layout: post
title: Git常见错误汇总
category: Git
tags: Git
description: Git常见错误汇总
---
##一.无法推送

    beginman@beginman:～/beginman.github.com$ git push origin master
    To git@github.com:BeginMan/beginman.github.com.git
     ! [rejected]        master -> master (non-fast-forward)
    error: 无法推送一些引用到 'git@github.com:BeginMan/beginman.github.com.git'
    提示：更新被拒绝，因为您当前分支的最新提交落后于其对应的远程分支。
    提示：再次推送前，先与远程变更合并（如 'git pull'）。详见
    提示：'git push --help' 中的 'Note about fast-forwards' 小节。
    
这是由于用户信息发生了变化，解决办法：

1/重新更新一般

2/强制提交，
    git push origin master -f
    
    
##二.ssh: Could not resolve hostname github.com: Name or service not known

这种错误类型有多种，比如你的.ssh下的config配置错了等，还有一种很奇葩的就是如果访问慢，也会提示这样，如下：

    $ ssh -T git@github.com　　＃　测试连接
    ssh: Could not resolve hostname github.com: Name or service not known

由于我使用的联通网络，对于github的访问超级慢，解决办法就是在hosts文件中添加其ip.具体见[关于Github和Stack Overflow访问慢，不能加载css、js解决办法](http://beginman.cn/git/2014/02/20/pool-github/).

添加完之后就可以了。

##三.提示
遇到问题最好去[Github Help　查看](https://help.github.com/categories/56/articles)

