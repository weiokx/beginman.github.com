---
layout: post
title: Django单元测试
category: django
---
##一.基础小结
django单元测试使用Python标准库`unittest`,提供了通用的接口，[**文档在这里**](https://docs.python.org/2/library/unittest.html).

在运行单元测试时，会遍历两个地方寻找所需的单元测试：

>1.`models.py`

>2.`tests.py`

上述无论哪种都需要满足的基本条件是含有`unittest.TestCase`的子类或者继承类，对于第二种，还需要这个py文件在一个app目录下，且必须也存在models.py。

##参考：
[1.Testing in Django](https://docs.djangoproject.com/en/dev/topics/testing/)
[2.Testing Django applications](https://docs.djangoproject.com/en/1.2/topics/testing/)
