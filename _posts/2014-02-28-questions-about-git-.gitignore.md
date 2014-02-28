---
layout: post
title: About git .gitignore
category: git
---
##1.How to Use Ignoring Files
If you don't want git to automatically add or even show you as being untracked,such as "_site;.pyc",you can create a file named ".gitignore" on your Main Contents.

About how to use it ,you can look here:

**More:**
[1.Git Documentation](http://git-scm.com/book/en/Git-Basics-Recording-Changes-to-the-Repository#Ignoring-Files)

[2.Git忽略文件](http://www.cnblogs.com/shangdawei/archive/2012/09/08/2676669.html)

##2.gitignore 失效了
.gitignore添加忽略文件之前一定要保证那些文件未被git跟踪,所以失效的原因就是文件已经被跟踪了,先使用命令`git rm --cached filename`将它们从索引中删除。

[More 1](http://www.cnblogs.com/BeginMan/p/3544804.html)
