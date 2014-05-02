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


