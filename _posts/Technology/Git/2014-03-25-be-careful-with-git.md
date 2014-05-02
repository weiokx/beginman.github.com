---
layout: post
title: 使用git应该注意的事项
category: Git
tags: Git
description: Git学习，使用git的注意事项
---
##一.时刻保持项目最新

>1.准备提交代码时，先执行`git pull ..`命令.

>2.`git status` 查看状态.

>3.在`git add`之前使用`git diff`查看修改，保证代码可行性.

>4.`git add`之后再一次`git pull ..`保证最新

>5.尽快`git commit`，紧接着`git push ..`

>6.查看git push的是否执行成功。

>7.在执行一遍`git pull ..`保证最新


##二.乱码现象
这里给出参考链接。

[**1.git 注意事项 for win.md**](https://github.com/roamlog/goods/blob/master/git%20%E6%B3%A8%E6%84%8F%E4%BA%8B%E9%A1%B9%20for%20win.md)

[**彻底解决Git中文乱码问题**](http://www.diguage.com/archives/26.html)

当然这大多数在windows电脑上面才会出现的问题，还是建议把开发环境迁移到Linux上。


##三.报错解决
###1.由于push之前没有pull而报错

这个一般要回滚到提交之前的版本，在这步之前最好把你修改的文件Copy出来，回滚后在git pull 获取最新，然后把你的修改的部分在copy回去，然后按照`一.时刻保持项目最新`的步骤执行下去。

**{持续更新中……}**

##四.推荐阅读：

[**1.COMMON GIT PROBLEMS AND SOLUTIONS**](http://blackbe.lt/common-git-problems-and-solutions/)
