---
layout: post
title: Python多线程编程
category: Python
tagline: by BeginMan
tags: [python,多线程]
description: Pyhton多线程编程，多线程学习，线程与进程。
---
##一.理解线程与进程
###1.1 进程(process)
进程是计算机中已运行程序的实体，是程序的基本执行实体，是线程的容器。它有两种运行方式：同步（循序）和异步（平行）。

![](http://www.bbc.co.uk/schools/gcsebitesize/design/images/fd_production_process.gif)

####1.1.1 进程与程序的关系
程序本身只是指令、数据及其组织形式的描述，进程才是程序（那些指令和数据）的真正运行实例。若干进程有可能与同一个程序相关系，计算机以进程的形式加载多个程序到存储器中。

以下参考可能会更加清晰了解程序与进程的关系：

>程序只是一个普通文件，是一个机器代码指令和数据的集合，这些指令和数据存储在磁盘上的一个可执行映象（Executable Image）中，所以，程序是一个静态的实体。这里，对可执行映象做进一步解释，可执行映象就是一个可执行文件的内容，例如，你编写了一个C源程序，最终这个源程序要经过编译、连接成为一个可执行文件后才能运行。源程序中你要定义许多变量，在可执行文件中，这些变量就组成了数据段的一部分；源程序中的许多语句，例如“ i++; for(i=0; i<10; i++);”等，在可执行文件中，它们对应着许多不同的机器代码指令，这些机器代码指令经CPU执行，就完成了你所期望的工作。可以这么说：程序代表你期望完成某工作的计划和步骤，它还浮在纸面上，等待具体实现。而具体的实现过程就是由进程来完成的，进程可以认为是运行中的程序，它除了包含程序中的所有内容外，还包含一些额外的数据。程序和进程的组成如图所示。

![](http://oss.org.cn/kernel-book/ch04/4.1.files/image002.gif)

####1.1.2进程与线程的关系
下图可见其关系

![](http://www.herbaat.com/wp-content/uploads/2014/01/process-and-thread.png)

###1.2 线程(thread)
####1.2.1 基本概念
**是操作系统能够进行运算调度的最小单位**。它被包含在进程之中，是进程中的实际运作单位。一条线程指的是进程中一个单一顺序的控制流，一个进程中可以并发多个线程，每条线程并行执行不同的任务。

线程有四种状态：

产生（spawn）

中断（block）

非中断（unblock）

退出（finish）
####1.2.2 多线程
线程是程序中一个单一的顺序控制流程.在单个程序中同时运行多个线程完成不同的工作,称为多线程。

为什么要引入多线程呢？有以下几个优点：
1.改进性能和并发(improved performance and concurrency),对于某些应用程序,可以提高性能和并发性通过使用多线程。

2.减少了所需的服务器数量。

缺点如下：

1.调试困难

2.并发难以管理，如果有大量的线程,会影响性能,因为操作系统需要在它们之间切换且更多的线程需要更多的内存空间。

####1.2.3 线程与进程的关系
在[**进程与线程的一个简单解释**](http://www.ruanyifeng.com/blog/2013/04/processes_and_threads.html) 这篇博客中，能显而易见地弄清楚它们之间的联系。

更多内容，可以参考[**Processes and Threads**](http://www.qnx.com/developers/docs/6.4.1/neutrino/getting_started/s1_procs.html?lang=cn#Threads_and_processes)

##二.Python多线程
###1.python解释器
python解释器将源代码转换为字节码然后执行的过程，这里的解释执行是相对于编译执行而言。更多内容参考[**Python解释执行原理**](http://www.wangyuxiong.com/archives/51258)
###2.python虚拟机
Python代码执行是由python虚拟机控制，在python虚拟机中同时只有一个线程执行，相当于单CPU运行多个进程，但是任意时刻只用一个进程在CPU中运行。
###3.python全局解释器锁
对python虚拟机访问是通过python全局解释器锁(global interpreter lock , GIL)控制，实现相当于一把锁，在进程与线程概念中，存在着共享内存，其他线程必须等它结束，才能使用这一块内存。GIL就是锁住然后打开的不断循环的过程，用以防止多个线程同时读写某一块内存区域。

![](http://deliveryimages.acm.org/10.1145/960000/959339/7124f1.png)
####4.time.sleep()演示进程工作

    #!/usr/bin/env python
    # coding=utf-8
    from time import sleep,ctime

    def foo1():
        print 'foo1 starting..'
        sleep(4)
        print 'foo1 sleep 4 seconds!'
    
    def foo2():
        print 'foo2 starting..'
        sleep(2)
        print 'foo2 sleep 2 seconds'
    
    def main():
        foo1()
        foo2()
    
    if __name__ == '__main__':
        main()
        
在单线程中顺序执行后，执行时间为这两个函数的总和，大约6秒多。

##三.thread模块的使用
在《Python核心编程》中，提示要**避免使用thread模块，而使用更高级的threading.**，一个重要原因就是当主进程（也叫父进程，表示创建了线程的进程）结束后，其所有线程都会被强制结束掉，无任何提醒，也不会用正常的清除工作。注意，在python3中，thread更名为_thread.

常用函数：

    thread.start_new_thread(function, args[, kwargs])
    #创建一个新线程并返回它的标识，其方法类似apply(),需要一个函数名和参数（必须是元组类型的，若无则传`()`）
    
    thread.exit()
    # 退出线程，若没有捕获则触犯SystemExit异常。
    
接下来实现上面的程序：

    #!/usr/bin/env python
    # coding=utf-8
    # try thread.
    import thread
    from time import sleep
    
    def foo1():
        print 'foo1 starting...'
        sleep(4)
        print 'foo1 sleep 3 seconds'
    
    def foo2():
        print 'foo2 starting...'
        sleep(2)
        print 'foo2 sleep 4 seconds'
    
    def main():
        thread.start_new_thread(foo1,()) #create a thread
        thread.start_new_thread(foo2,()) #create a thread
        sleep(6) #如果不加这个或者sleep时间小于（2+4）则也会出错
        
    if __name__ == "__main__":
        main()
        
注意，如果不在main()函数后添加sleep(6)则会**报错**，Unhandled exception in thread started by sys.excepthook is missing lost sys.stderr。这就体现了**当主进程（也叫父进程，表示创建了线程的进程）结束后，其所有线程都会被强制结束掉**。添加在主函数添加sleep()的目的就是让主线程稍微停下等待所有的子线程结束后再继续执行代码。

理想状态下，通过多线程实现两个程序的并发执行，程序运行的总时间就是线程运行时间最慢的一个。这里就是4秒了。
但是为了管理线程，主线程不得不加sleep来等待所有子线程，这样一来运行时间不比单线程短，还有一点由于多线程运行时间不确定，所以单单用sleep控制主线程是不靠谱的，这里就要用到**锁**了。
    
    #!/usr/bin/env python
    # coding=utf-8
    import thread
    from time import sleep
    
    loops = [4,2]
    
    def foo(nloop,nsec,lock):
        print '%s starting...' %nloop
        sleep(nsec)
        print '%s sleep %s second' %(nloop,nsec)
        lock.release() #释放锁
    
    def main():
        locks= []  # lock object list
        nloops = range(len(loops))
    
        # create LockType
        for i in nloops:
            lock = thread.allocate_lock() # 分配LockType类型的锁对象
            lock.acquire() # 尝试获取锁对象
            locks.append(lock) 
        
        # create thread
        for i in nloops:
            thread.start_new_thread(foo,(i,loops[i],locks[i]))
            while locks[i].locked():pass  # 返回锁对象
    
    if __name__ == '__main__':
        main()
    

##四.threading模块的使用



##参考
[1.WIKI之进程](http://zh.wikipedia.org/wiki/%E8%BF%9B%E7%A8%8B)

[2.深入分析Linux内核源码之进程和程序（Process and Program）](http://oss.org.cn/kernel-book/ch04/4.1.htm)

[3.WIKI之线程](http://zh.wikipedia.org/wiki/%E7%BA%BF%E7%A8%8B)






