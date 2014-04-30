---
layout: post
title: Ubuntu+Vim+Retext+Git+github+Shutter+七牛云存储 是个绝妙的组合
category: life
---
##一.简要说明
这组合的优雅之处可归纳如下：

**1.Ubuntu的强大和快速灵敏**

Ubuntu 我不用多介绍里，性能超牛，速度超快，而且占用内存和资源很少，开启3D桌面更是屌炸天，由于其占用内存少故你几乎不用考虑开启3D特效后带来的影响性能的隐患，我的2G内存开启3D之后还跑得贼快了。。。

**2.Vim 无所不能的编辑器**

![](http://images.cnitblog.com/blog/353475/201306/02194428-1bc6d5a8e1ca4d549ebdeda70ad19ed7.png)

[**vim配置文件和插件**](https://github.com/ma6174/vim)

**3.Retext**

![](http://sourceforge.net/p/retext/screenshot/retext-kde.png)

Linux下的Markdown编辑器，最佳安装方式如下：

    sudo add-apt-repository ppa:mitya57
    sudo apt-get update
    sudo apt-get install retext
    
**4.再github的基础上基于Jekyll搭建blog**

300Mb的免费空间，稳定且方便，如我的博客：[http://www.beginman.cn](http://www.beginman.cn)

**5.Shutter**

Ubuntu下强大的截屏软件，可设置效果，可ftp上传。

![](http://beginman.qiniudn.com/shutter)

**6.七牛云存储**

你还在为写博客找图床而烦恼吗？你还在为上传文件服务器困惑吗？申请七牛云开发者，可以免费获取云空间，不过限制也可大，对下载量/请求量都会有限制，不过作为写点博客上传写图片，文件等绰绰有余里。

可以下载其工具进行处理操作，这里我选择了命令行形式的。文档如下：

[七牛开发者中心](http://developer.qiniu.com/docs/v6/tools/qboxrsctl.html)

这里我利用.bashrc个性化配置，简化里命令过程，个人配置如下：

    # fcitx 输入法
    export XMODIFIERS=”@im=fcitx”
    # 七牛云存储设置
    alias qnlogin='/home/beginman/qiniu/qboxrsctl login 你的用户名 你的密码 # 登录
    alias qninfo='/home/beginman/qiniu/qboxrsctl info' # 查看帐号信息
    alias qnkey='/home/beginman/qiniu/qboxrsctl newaccess ' # 生成密钥 后面要输入appname名称
    alias qnappinfo='/home/beginman/qiniu/qboxrsctl appinfo ' #查看密钥 后面要输入appname名称
    alias qndelkey='/home/beginman/qiniu/qboxrsctl delaccess ' # 删除密钥 后面两个参数，appname 和 查看的密钥
    alias qnmk='/home/beginman/qiniu/qboxrsctl mkbucket ' # 创建空间 后面输入空间名
    alias qnprivate='/home/beginman/qiniu/qboxrsctl private ' # 将空间设为私有 后面两个参数 空间名和 1
    alias qnbox='/home/beginman/qiniu/qboxrsctl buckets' # 列出所有空间
    alias qnaboxinfo='/home/beginman/qiniu/qboxrsctl bucketinfo ' # 查看指定空间信息 后面输入空间名
    alias qnboxdel='/home/beginman/qiniu/qboxrsctl drop -f ' # 删除指定空间 后面输入空间名
    alias qnpost='/home/beginman/qiniu/qboxrsctl put beginman ' # 上传文件（这里我默认上传到beginman空间）后面两个参数 关键字和文件绝对路径
    alias qnbigpost='/home/beginman/qiniu/qboxrsctl put -c beginman ' #上传大文件 参数同上
    alias qndownload='/home/beginman/qiniu/qboxrsctl get beginman ' #下载文件（这里我默认上传到beginman空间）后面两个参数 关键字和文件绝对路径
    alias qncatfile='/home/beginman/qiniu/qboxrsctl stat beginman ' #查看文件 后面要输入关键字
    alias qndelfile='/home/beginman/qiniu/qboxrsctl del beginman ' #删除文件 后面要输入关键字
     
    # 更多内容见七牛文档：http://developer.qiniu.com/docs/v6/tools/qboxrsctl.html
     
    # 个人Linux常用
    alias cls='clear'    # 清屏
    alias pyrun='python manage.py runserver' #启动python脚本
    alias gs='git push origin master'  # 简化
    alias gl='git pull origin master'  # 简化
    alias qn='cd /home/beginman/qiniu/'  # cd 到七牛文件夹
    alias pro='cd /home/beginman/myproject/' # cd到我的项目里

演示如下：
    [beginman@beginman qiniu]$ qnlogin   # 登录（会话最长1个小时，过后再登录）
    [beginman@beginman qiniu]$ qninfo    # 个人信息
    UserId:		 *****************
    Uid:		 *******************
    Email:		 xinxinyu2011@163.com
    UserType:	 stduser(0x4)
    DeviceNum:	 0
    InvitationNum:	 0
    [beginman@beginman qiniu]$ qnpost shutter shutter.png  # 上传图片
    MimeType: image/png
     [beginman@beginman qiniu]$ qncatfile shutter        # 查看文件信息
    {"hash":"Fo3tEPqHPuJOfgvPvvDLyhcpHyrf","fsize":184308,"putTime":13988766031278923,"mimeType":"image/png","endUser":""}
   
   
上传之后，浏览器打开：http://你的空间名.qiniudn.com/你刚才上传的图片关键字

如我的：http://beginman.qiniudn.com/shutter  就可以直接显示该图片了。


