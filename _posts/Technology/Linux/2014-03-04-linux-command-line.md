---
layout: post
title: linux Bash Shell 快捷键使用
category: Linux
tags: Linux
description: Linux学习，linux常用命令和技巧
---
#Bash Shell 快捷键
可以查看这里[**让你提升命令行效率的 Bash 快捷键**](https://linuxtoy.org/archives/bash-shortcuts.html),但是有一点的上，复制粘贴快捷上面没有，这里补充下：

>`Shift+Ctrl+C`:复制当前光标选择的内容

>`Shift+Ctrl+V`:粘贴当前光标选择的内容

>`ctrl+u`:剪切光标之前的内容，不包括当前字符

>`ctrl+k`:剪切光标之后的内容，包括自身

>`ctrl+w`:剪切光标之前的一个词

>`alt+d`:剪切光标之后的一个词

>`ctrl+y`:粘贴当前剪切数据

**重在自己要多加运用，孰能生巧。**

##编辑命令

Ctrl + a ：移到命令行首
Ctrl + e ：移到命令行尾
Ctrl + f ：按字符前移（右向）
Ctrl + b ：按字符后移（左向）
Alt + f ：按单词前移（右向）
Alt + b ：按单词后移（左向）
Ctrl + xx：在命令行首和光标之间移动
Ctrl + u ：从光标处删除至命令行首
Ctrl + k ：从光标处删除至命令行尾
Ctrl + w ：从光标处删除至字首
Alt + d ：从光标处删除至字尾
Ctrl + d ：删除光标处的字符
Ctrl + h ：删除光标前的字符
Ctrl + y ：粘贴至光标后
Alt + c ：从光标处更改为首字母大写的单词
Alt + u ：从光标处更改为全部大写的单词
Alt + l ：从光标处更改为全部小写的单词
Ctrl + t ：交换光标处和之前的字符
Alt + t ：交换光标处和之前的单词
Alt + Backspace：与 Ctrl + w 相同类似，分隔符有些差别 [感谢 rezilla 指正]

##重新执行命令

Ctrl + r：逆向搜索命令历史
Ctrl + g：从历史搜索模式退出
Ctrl + p：历史中的上一条命令
Ctrl + n：历史中的下一条命令
Alt + .：使用上一条命令的最后一个参数

##控制命令

Ctrl + l：清屏
Ctrl + o：执行当前命令，并选择上一条命令
Ctrl + s：阻止屏幕输出
Ctrl + q：允许屏幕输出
Ctrl + c：终止命令
Ctrl + z：挂起命令

##Bang (!) 命令

!!：执行上一条命令
!blah：执行最近的以 blah 开头的命令，如 !ls
!blah:p：仅打印输出，而不执行
!$：上一条命令的最后一个参数，与 Alt + . 相同
!$:p：打印输出 !$ 的内容
!*：上一条命令的所有参数
!*:p：打印输出 !* 的内容
^blah：删除上一条命令中的 blah
^blah^foo：将上一条命令中的 blah 替换为 foo
^blah^foo^：将上一条命令中所有的 blah 都替换为 foo

##友情提示：

以上介绍的大多数 Bash 快捷键仅当在 emacs 编辑模式时有效，若你将 Bash 配置为 vi 编辑模式，那将遵循 vi 的按键绑定。Bash 默认为 emacs 编辑模式。如果你的 Bash 不在 emacs 编辑模式，可通过 set -o emacs 设置。
^S、^Q、^C、^Z 是由终端设备处理的，可用 stty 命令设置。

##参考：
[让你提升命令行效率的 Bash 快捷键 [完整版]](https://linuxtoy.org/archives/bash-shortcuts.html)
