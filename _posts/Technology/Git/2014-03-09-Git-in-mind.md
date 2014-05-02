---
layout: post
title: Git一套简流
category: Git
tags: Git
description: Git学习，git log常用命令以及技巧
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

>当使用时，会出现以下三种情况的中文乱码：

>1.ls不能显示中文目录 
解决办法：在%GIT_HOME%/etc/git-completion.bash中增加一行：
 
	alias ls='ls --show-control-chars --color=auto'


>2.git commit不能提交中文注释 
解决办法：修改%GIT_HOME%/etc/inputrc中对应的行：

	set output-meta on 
	set convert-meta off


>3.git log无法显示中文注释 
解决办法：在%GIT_HOME%/etc/profile中增加一行：

	export LESSCHARSET=iso8859

*个人建议：对于不清楚目录在何处的时候，下载使用Everything工具能神速查询文件。*

**[3].全局配置**

No1.用户信息配置：

	$ git config --global user.name "fp"
	$ git config --global user.email "fangpeng@tbkt.cn"

如果存在多帐号，可以查看[这篇博客:git初体验（七）多账户的使用](http://www.cnblogs.com/BeginMan/p/3548139.html)。

配置完成后，可以检查是否配置成：如下列举Github的：

	$ ssh -T git@github.com
	Hi BeginMan! You've successfully authenticated, but GitHub does not provide shel
	l access.

如果它Hi了你，就说用户信息配置成功了。

No2.高亮配置

	$ git config --global color.ui auto

No3.别名配置

就是简化命令，如`git status` 可以简化为`git st`.个人配置如下：

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

上面的是针对当前项目的，如果设置 --system 则表示整个系统通用。

或者你可以这样：

	$ git config -e				#打开当前配置
	$ git config -e --global    #打开全局配置
	$ git config -e --system		#打开系统配置

打开文件直接修改。

如果是Linux用户，也可以直接修改Linux别名，会更爽的，如下：

    $ vi ~/.bashrc      # 打开系统配置文件，编辑如下：
    
    # alias
    alias cls='clear'    # 清屏
    alias pyrun='python manage.py runserver' #启动python脚本
    alias snv='sl'     # sl效果：跑小火车
    alias gti='sl'
    alias gm='git push origin master'  # 简化
    alias gl='git pull origin master'  # 简化
    
    $ source ~/.bashrc   #保存后，让其立即生效
   
这个sl就是一个娱乐效果，比如把ls打成了sl,把git打成了gti,系统会硬生生提示你错误信息，不如来个搞笑的东西，娱乐娱乐。

    sudo apt-get install sl


![](http://images.cnblogs.com/cnblogs_com/BeginMan/486940/o_bdemo.gif)

       

###2.建立工作区

也就是取得项目的 Git 仓库，分为两类:
>**1.初始化新仓库**

>你可以选择合适的目录使用鼠标右键的`Git init here`,或者打开Bash环境直接`$ git init <DirtoryName>`(git1.6.7版本以上可以直接在init后面带目录名自动创建该目录。)

>然后添加远程仓库路径：

	$ git remote add origin git@github.com:BeginMan/test.git	

>全部更新：

	$ git pull origin master

>查看远程仓库信息：
>
`$ git remote`:显示远程仓库名；`$ git remote -v`:显示相信信息

>**2.从现有仓库克隆**

	git clone [url]

如：

	$ git clone git://github.com/schacon/grit.git

这会在当前目录下创建一个名为grit的目录，其中包含一个 .git 的目录，用于保存下载下来的所有版本记录。

	$ git clone git://github.com/schacon/grit.git mygrit

新建的目录成了 mygrit。

**注意：**
>多人协作时，如果远程仓库存在多个分支，则团队成功Clone的时候只能看到本地的master分支。

	$ git branch
	* master

>如果成员要在dev分支上开发，就需要创建远程origin的dev分支到本地（前提是分支与远程上的分支对应）：

	$ git checkout -b dev origin/dev

>然后建立本地分支和远程分支的关联：

	$ git branch --set-upstream dev origin/dev
	Branch dev set up to track remote branch dev from origin.

>最后从远程抓取分支：

	git pull

###3.一些必需的东西

上面我们已经把该准备的都准备了，那么现在还需要准备什么呢？相信下面的信息会让你觉得路还有很长……

1.一款顺手的编辑器

比如写提交说明的时候，window下默认的是vi,如果在Linux下，可以设置想要的编辑器，如vim/emacs/sublime等，如果查看日志过长则git默认开启分页器，。less分页器默认使用vi风格的热键……综上所述，必需学习"**Vim**"编辑器，否则你连退出都不在怎么退的。

在git中可以设置你想要的编辑器：

    git config --global core.editor


[**简明 Vim 练级攻略**](http://coolshell.cn/articles/5426.html)

[**25个Vim教程、视频和资源**](http://blog.jobbole.com/10250/)

2.Git教程

[**Git官网中文版**](http://git-scm.com/book/zh/)

3.Github

[**程序员的facebook**.](http://beginman.cn/wiki/github.html)

[**GotGitHub**](http://www.worldhello.net/gotgithub/)


##三、开始工作

如果上面的我们准备好了，那么现在就开始工作吧！

##1.一个分支上的整个流程
默认的我们使用master分支，以下就以这个分支来进行整个工作流程。

**[1].新建或修改文件**

	$ >a.py #更简洁的一种Linux创建文件的方式
	# 或者使用 $ touch a.py
	# 以下按照这个文件处理：
	$ echo 'print "Hello,world"'>test.py

这里新建了一个test.py文件并编辑了内容。常见庆幸比如我们复制进入几个图片，样式等等。

**[2].查看状态**

	$ git status
	On branch master
	Untracked files:
	  (use "git add <file>..." to include in what will be committed)
	
	        test.py
	
	nothing added to commit but untracked files present (use "git add" to track)

中文翻译就是：

	在master分支上
	未暂存文件：
	(使用`git add <file>`加入暂存区)


这里会衍生2个扩展：`(1)暂存区/工作区/本地仓库`、`(2)git add命令详解`

>暂存区：暂且看作临时常所，午托中介（后面会有详解）;工作区：就是你的项目所在你电脑上哪个盘，哪个目录下，不含.git；本地仓库就是你的项目下的.git。
>
[关于暂存区/工作区/本地仓库](http://www.liaoxuefeng.com/wiki/0013739516305929606dd18361248578c67b8067c8c017b000/0013745374151782eb658c5a5ca454eaa451661275886c6000)

>'git add':

	git add <path>把<path>添加到索引库中，<path>可以是文件也可以是目录。
	git add -u [<path>]: 把<path>中所有tracked文件中
	被修改过或已删除文件的信息添加到索引库。它不会处理untracted的文件.
	git add -A: [<path>]表示把<path>中所有tracked文件中被修改过或已删除文件和所有untracted的文件信息添加到索引库。
	git add -i [<path>]命令查看<path>中被所有修改过或已删除文件但没有提交的文件


**[3].加入暂存区**

	$ git add test.py
	#或者可以这样：$ git add --all 表示全部加入，包含新添加的文件
	# $ git add . #全部加入但不包括新添加的文件
	
*不管是新添加的文件，还是修改了的文件，都需要`git add <file>`,这点不同于SVN*

此刻再查看状态：

	$ git st
	On branch master
	Changes to be committed:
	  (use "git reset HEAD <file>..." to unstage)
	
	        new file:   test.py

意思就是在master分支上，以下列表文件改变待提交，可以使用`git reset HEAD <file>`拉回未暂存区。相应的原先红色变成了现在的绿色。

这里衍生了一个扩展：`(3)如何拉回未暂存区`

**[4].查看快照**

	$ git diff	#尚未暂存的文件更新了哪些部分（unstaged）和上次提交与本地索引间的差异
	$ git diff --cached  #已暂存的文件和上次提交时的快照之间的差异(staged,添加到索引中)
	#上面效果同：git diff --staged
	$ git diff HEAD显示你工作目录与上次提交时之间的所有差别

如下：

	$ git diff HEAD
	diff --git a/test.py b/test.py
	new file mode 100644
	index 0000000..15715f8
	--- /dev/null
	+++ b/test.py
	@@ -0,0 +1 @@
	+print "Hello,world"

意思如下：---代表源文件；+++代表目标文件；-开头的行，是只出现在源文件中的行；+开头的行，是只出现在目标文件中的行；每个差异小结的第一行都是定位语句，由@@开头，@@结尾。+print "Hello,world"表示增加的行内容.


**[5].提交版本库**

	$ git commit -m 'add test.py'

	git commit  -m "提交的描述信息"
	git commit -a -m "提交的描述信息" -a选项将所有被修改或已删除且已经被git管理的文件加入暂存区。
	相当于上面的：git add <file> + git commit -m 'xx'

**[6].推送远程仓库**

	$ git push origin master 

>  注意：需要说明的是，默认情况下这条语句等价于提交本地的master仓库到远程仓库，并作为远程的master分支。如果想把本地的某个分支test提交到远程仓库，并作为远程仓库的master分支，或者作为另外一个名叫test的分支，那么可以这么做。

	$ git push origin test:master  #提交本地test分支作为远程的master分支
	$ git push origin test:test    #提交本地test分支作为远程的test分支

如果想删除远程的分支呢？类似于上面，如果:左边的分支为空，那么将删除:右边的远程的分支。

	$ git push origin :test        #刚提交到远程的test将被删除，但是本地还会保存的，不用担心。

##2.多个分支上的整个流程

我们可能需要多个分支，而不是总在一个master主分支上动手脚，比如需要一个`dev 开发分支`、`bug 分支`，那么接下来的工作就是多个分支的整个流程。

**[1].创建并切换分支**	

	$ git branch dev		# 创建分支dev分支
	$ git checkout dev      # 切换到dev分支
	Switched to branch 'dev'

	$ git checkout master	# 切换回来(master分支)
	Switched to branch 'master'

	#git checkout命令加上-b参数表示创建并切换
	$ git checkout -b bug  # 创建分支bug分支并自动切换
	Switched to a new branch 'bug'

**[2].查看分支**

	$ git branch  # 查看分支
	* bug         # 带*且为绿色表示当前所在的分支
	  dev
	  master

**[3].Git储蓄**

情景如下：当你正在开发一个功能时，突然boss让你尽快修改一个bug，此时最紧急的是fix bug. 而正开发的功能尚未完善还不能提交，这个时候就会想到能不能将手头的工作隔离开，去单单解决bug，然后提交bug，然后在进行手头工作。


	git stash  #把当前工作现场“储藏”起来

ok,存起来后我们就要改bug了，next step:

**[3].在其他分支上工作**

好了，我现在是在bug分支上，我要把之前的test.py内容的print 'hello world',改成 print '同步课堂',N秒之后，改完了，这个时候的工作流程就回到了上述的“一个分支的整个流程”上了。如下：
	
	$ git ci -a -m 'update test.py'    # 别名，加入暂存区并提交版本库
	[bug 237586b] update test.py
	 1 file changed, 1 insertion(+), 1 deletion(-)

	$ git ps origin bug:bug            #提交本地bug分支作为远程的bug分支，如果远程没有会自动创建。
	Counting objects: 5, done.
	Delta compression using up to 2 threads.
	Compressing objects: 100% (2/2), done.
	Writing objects: 100% (3/3), 272 bytes | 0 bytes/s, done.
	Total 3 (delta 1), reused 0 (delta 0)
	To git@github.com:BeginMan/test.git
	 * [new branch]      bug -> bug   # 可以从这里看到信息
	 
好了，我给Boss说，bug被搞好了。然后我安然的回到我的dev分支上继续完成之前的工作。N小时候，dev上的功能开发好了。那么就Next step:

**[4].合并分支**

在合并分支之前，我们要找到暂存的东西，就好像鬼子进村之后召开村民大会，此时你正在啃玉米棒子，眼看鬼子要来了，你立马把玉米棒装在袜子里面然后藏在床下(`$ git stash`),然后参加完鬼子大会后，你回来要继续啃玉米棒子，你就要找袜子啊，此时`$ git stash list`查看储藏列表：

	$ git stash list
	stash@{0}: WIP on dev: 8552442 add merge  #找到了袜子，编号为stash@{0}
	# 接下来就要还原现场了
	$ git stash apply stash@{0} #恢复
	$ git stash drop    #删除
	# 也可以使用git stash pop恢复的同时把stash内容也删了。

*合并分支继续：*

	$ git merge dev 	#git merge命令用于合并指定分支到当前分支

>注意：

通常，合并分支时Git会用“Fast forward”模式，不会存在历史记录信息，相当于一种无痕模式；可以加上`--no-ff`参数，表示禁用“Fast forward”,它会合并要创建一个新的commit，所以加上-m参数，合并后`git log` 就能查看分支历史了：

	$ git merge --no-ff -m "编辑信息" 分支名称
	$ git merge --no-ff -m "merge dev" dev

上面的dev分支是我们随便搞了一个临时分支，我们把这个分支上面的成果合并到主分支上。如果不想留着这个临时分支，可以删除，如下：

**[5].删除分支**

	$ git branch -d dev
	Deleted branch dev (was 1901221).

##3.我们可能遇到的问题
这个还是觉得要个人总结，毕竟只有遇到困难，理解与记忆才最深。

也可以查看[Git常见错误汇总](http://beginman.cn/jekyll/2014/02/25/common-error-for-git.html)，随时更新汇总。

**[No1].如何忽略一些文件**

一些文件，如python编译文件‘pyc’,日志文件‘2014-03-10.log’等等这些不需要提交版本，可以用以下方法解决：创建一个名为 .gitignore 的文件，列出要忽略的文件模式。

    $ >.gitignore   # linux
    copy con .gitignore # windows

然后在里面写忽略规则：

>忽略规则是对文件名有效的;

>A: 空行或#号开始的行,会被忽略;

>B: 可以使用通配符:

    *        任意字符;
    ?        单个字符;
    [abc]    多种可能的字符a、b或c;
    [a-z0-9] 表示在某个范围内进行匹配;
    \        转义字符;
    !        表示取反(不忽略),写在某条规则的前面;
       
>C: 路径分隔符"/";如果"/"后面的名称是个目录,则该目录以及该目录下的所有文件都会被忽略;如果"/"后面的名称是个文件,则该文件不会被忽略;

   例如: /name
   如果name是个目录,则目录name和name下的所有文件都会被忽略;如果name是个文件,则该文件不会被忽略;
   
>D: .gitignore文件也可以忽略自己,只要把自己的名字写进来即可;
>E: 一条(行)忽略规则只对某一个目录下的文件有效,而对该目录下的子目录中的文件无效;
>F: 一条(行)忽略规则也可以只对单个文件有效(忽略单个指定的文件);

例如:

    *.pyc       #忽略所有以.pyc为后缀的文件;
    !lib.a    #不忽略文件lib.a;
    /tbkt     #只忽略此目录下tbkt文件,子目录的tbkt不被忽略;
    log/    #忽略log目录下的所有文件;
    doc/*.txt #只忽略doc/下所有的txt文件,但是不忽略doc/subdir/下的txt文件;
    
*一个常见的问题是：已经加入了忽略文件，为什么还会在版本控制中？这是因为在加入之前已经被跟踪了，解除跟踪即可。见Next step:*


    
**[No2].如何移除一些文件**

**情景1：新添加一个文件，没有加入暂存区。**

    $ echo "try to delete">b.txt
    $ git st
    # 位于分支 master
    # Untracked files:
    #   （使用 "git add <file>..." 以包含要提交的内容）
    #
    #	b.txt
    nothing added to commit but untracked files present (use "git add" to track)
    $ git rm b.txt     # git rm：从已跟踪文件清单（暂存区）中移除。
    fatal: 路径 'b.txt' 未匹配任何文件
    $ rm b.txt        # 手动删除
    $ git st
    # 位于分支 master
    nothing to commit, working directory clean

这种情况，最好处理，没什么问题！

**情景2：修改了已有文件，没有加入暂存区**

    [beginman@beginman test]$ cat a.txt 
    ok
    [beginman@beginman test]$ echo "Wow">a.txt
    [beginman@beginman test]$ cat a.txt 
    Wow
    [beginman@beginman test]$ git st
    # 位于分支 master
    # 尚未暂存以备提交的变更：
    #   （使用 "git add <file>..." 更新要提交的内容）
    #   （使用 "git checkout -- <file>..." 丢弃工作区的改动）
    #
    #	修改：      a.txt
    #
    no changes added to commit (use "git add" and/or "git commit -a")
    [beginman@beginman test]$ git rm a.txt
    error: 'a.txt' 有本地修改
    （使用 --cached 保存文件，或用 -f 强制删除）

它会提示我们使用 --cached 保存文件，或用 -f 强制删除，如果删除之前修改过并且已经放到暂存区域的话，则必须要用强制删除选项 -f；另外一种情况是，我们想把文件从 Git 仓库中删除（亦即从暂存区域移除），但仍然希望保留在当前工作目录中用 --cached 选项即可。

    [beginman@beginman test]$ git rm --cached a.txt
    rm 'a.txt'
    [beginman@beginman test]$ ls
    a.txt  README.md
    [beginman@beginman test]$ git st
    # 位于分支 master
    # 要提交的变更：
    #   （使用 "git reset HEAD <file>..." 撤出暂存区）
    #
    #	删除：      a.txt
    #
    # Untracked files:
    #   （使用 "git add <file>..." 以包含要提交的内容）
    #
    #	a.txt

**情景3：未修改已有文件**

    [beginman@beginman test]$ git rm README.md
    [beginman@beginman test]$ git st
    # 位于分支 master
    # 要提交的变更：
    #   （使用 "git reset HEAD <file>..." 撤出暂存区）
    #
    #	删除：      README.md
    #	删除：      a.txt
    #

**小结：**

>从这三个情景，我们得出的小结如下：

>1.git rm <filename> 命令把一个文件删除，并把它从git的仓库管理系统中移除。如果是文件夹则：git rm -r <dirname>

>2.git rm --cached 从git的索引库中移除,但是对文件本身并不进行任何操作。

>3.git rm -f强制删除

**[No3].如何移动一些文件**

    $ git mv file_from file_to
    # 相当于执行了下面三条命令
    $ mv file_from file_to
    $ git rm file_from
    $ git add file_to
    
比如如下操作：

    [beginman@beginman test]$ mkdir do
    [beginman@beginman test]$ ls
    c.txt  do
    [beginman@beginman test]$ git mv c.txt do/abc.txt
    [beginman@beginman test]$ ls
    do
    [beginman@beginman test]$ ls do/
    abc.txt
    [beginman@beginman test]$ git st
    # 位于分支 master
    # 要提交的变更：
    #   （使用 "git reset HEAD <file>..." 撤出暂存区）
    #
    #	删除：      README.md
    #	重命名：    a.txt -> do/abc.txt
    #
    
    
**[No4].如何撤销一些文件**  
  
情景1.撤销最后一次的提交

    $ git commit --amend
    git reset --hard commit_id （–hard：彻底回退到某个版本，本地的源码也会变为上一个版本的内容）
    
情景2.取消已经暂存的文件

    git reset HEAD <file>. 
    
情景3.取消对文件的修改

    git checkout -- <file>.

##四、线上活动
完成中……