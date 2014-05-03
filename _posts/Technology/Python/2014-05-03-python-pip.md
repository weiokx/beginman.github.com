---
layout: post
title: Python Pip
category: Python
tags: Python
description: Python pip的简明教程
---
##一.简介
pip是Python包管理和安装的工具，我们从其[官网中获取安装信息](https://pip.pypa.io/en/latest/installing.html)

Python安装包的管理有 下载/更新/删除等，安装pip之后使得安装其他python模块更加得心应手，在此之前有个叫easy_install的安装工具，但是现在慢慢的被pip所取代。下面是pip官网上对pip与easy_install进行的比较：

>pip is meant to improve on easy_install. Some of the improvements:

>    All packages are downloaded before installation. Partially-completed installation doesn’t occur as a result.

>    Care is taken to present useful output on the console.

>    The reasons for actions are kept track of. For instance, if a package is being installed, pip keeps track of why that package was required.

>    Error messages should be useful.

>    The code is relatively concise and cohesive, making it easier to use programmatically.

>    Packages don’t have to be installed as egg archives, they can be installed flat (while keeping the egg metadata).

>    Native support for other version control systems (Git, Mercurial and Bazaar)

>    Uninstallation of packages.

>    Simple to define fixed sets of requirements and reliably reproduce a set of packages.

>    pip doesn’t do everything that easy_install does. Specifically:


>        It cannot install from eggs. It only installs from source. (In the future it would be good if it could install binaries from Windows .exe or .msi – binary install on other platforms is not a priority.)

>        It is incompatible with some packages that extensively customize distutils or setuptools in their setup.py files.

>        pip is complementary with virtualenv, and it is encouraged that you use virtualenv to isolate your installation.

如果你想知道更多的为什么pip取代了easy_install,可以从这个stackoverflow中得到答案[Why use pip over easy_install?](http://stackoverflow.com/questions/3220404/why-use-pip-over-easy-install)

##安装与使用
###安装
万能的安装方式是下载get-pip.py 然后python get-pip.py ,在linux下要加上sudo.

Linux下：

    #On Debian and Ubuntu:
    sudo apt-get install python-pip
    #On Fedora:
    sudo yum install python-pip

   
