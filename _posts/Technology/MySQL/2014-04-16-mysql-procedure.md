---
layout: post
title: mysql存储过程及Python对存储过程的操作
category: MySQL
tags: MySQL
keywords: MySQL,大量数据,插入,性能
description: mysql存储过程及Python对存储过程的操作
---
##一、Mysql存储过程的介绍

存储过程(Stored Procedure)和函数(Function),这个概念在其他主流数据库都存在，而Mysql 5.0+才支持了这两个功能。对于传统的数据库操作语句(SQL),在执行时都需要事先编译，然后再执行。存储过程是集成了一系列SQL语句来完成特定功能，经编译后存储在数据库中，且是预编译的。一旦它被存储了，客户端不需要再重新发布单独的语句，而是可以引用存储程序来替代。

##二、Mysql存储过程的学习

###1.创建存储过程：
**语法如下：**

	create procedure 存储过程名([参数种类1 参数1 参数类型1[,...]]）
	begin
	    处理内容
	end

要明确地把子程序与一个给定数据库关联起来，可以在创建子程序的时候指定其名字为`数据库名.存储过程名`。

**参数种类：**

MySQL存储过程的参数用在存储过程的定义，共有三种参数类型,IN,OUT,INOUT,形式如：

	CREATE PROCEDURE([[IN |OUT |INOUT ] 参数名 数据类型...]) 

默认的是in类型;指定参数为IN, OUT, 或INOUT 只对PROCEDURE是合法的。（FUNCTION参数总是被认为是IN参数）。


**简单的例子：**
	
	mysql> delimiter // 	-- 用mysql客户端delimiter命令来把语句定界符从 ;变为//
	
	mysql> CREATE PROCEDURE simpleproc (OUT param1 INT) -- 创建名为simpleproc的存储过程，且其整型参数param1是OUT类型的
	    -> BEGIN				-- 过程体的开始与结束使用BEGIN与END进行标识
	    ->   SELECT COUNT(*) INTO param1 FROM t;		-- 查询表t数据量赋给 参数param1并返回值
	    -> END				-- 结束
	    -> //				-- 定界符结束，开始创建存储过程。
	Query OK, 0 rows affected (0.00 sec)
	 
	mysql> delimiter ;		-- 转换过来
	 
	mysql> CALL simpleproc(@a);		-- 调用存储过程
	Query OK, 0 rows affected (0.00 sec)
	 
	mysql> SELECT @a;			-- 输出数据
	+------+
	| @a   |
	+------+
	| 3    |
	+------+
	1 row in set (0.00 sec)

从这个简单的存储过程中可分析如下：（以下分析[参考这里](http://xdj651897373-126-com.iteye.com/blog/1819924)）

>（1）这里需要注意的是DELIMITER //和DELIMITER ;两句，DELIMITER是分割符的意思，因为MySQL默认以";"为分隔符，如果我们没有声明分割符，那么编译器会把存储过程当成SQL语句进行处理，则存储过程的编译过程会报错，所以要事先用DELIMITER关键字申明当前段分隔符，这样MySQL才会将";"当做存储过程中的代码，不会执行这些代码，用完了之后要把分隔符还原。 

>（2）存储过程根据需要可能会有输入、输出、输入输出参数，这里有一个输出参数param1，类型是int型，如果有多个参数用","分割开。 

###2.修改存储过程

**语法介绍：**

	ALTER PROCEDURE sp_name [characteristic ...]

###3.删除存储过程

	DROP {PROCEDURE | FUNCTION} [IF EXISTS] sp_name

移除一个存储程序或函数

###4.查看存储过程

	# 直接查询
	select `specific_name` from mysql.proc where db = 'your_db_name' and `type` = 'procedure'
	# 显示所有
	show procedure status;
	# 查看当前数据库里存储过程列表
	select specific_name from mysql.proc ;	
	#查看某一个存储过程的具体内容
	select body from mysql.proc where specific_name = 'your_proc_name';
	# 查看存储过程或函数的创建代码 ：
	show create procedure your_proc_name;
	show create function your_func_name;

##三、存储过程常用语句

###1.CALL语句

语法如下：

	CALL sp_name([parameter[,...]])


###2.BEGIN ... END复合语句

语法如下：

	BEGIN
	    [statement_list]
	END 

statement_list 代表一个或多个语句的列表。statement_list之内每个语句都必须用分号（；）来结尾

###3.DECLARE语句

局部变量，语法如下：

	DECLARE variable_name [,variable_name...] datatype [DEFAULT value]; 
	# demo
	DECLARE l_int int unsigned default 4000000;  
	DECLARE l_varchar varchar(255) DEFAULT 'This will not be padded';   

其中，datatype为MySQL的数据类型，如:int, float, date, varchar(length) ，**DECLARE仅被用在BEGIN ... END复合语句里，并且必须在复合语句的开头，在任何其它语句之前。**

###4.变量SET语句

语法如下：

	SET var_name = expr [, var_name = expr] ...	

###5. SELECT ... INTO语句

语法如下：

	SELECT col_name[,...] INTO var_name[,...] table_expr
	#demo
	SELECT id,data INTO x,y FROM test.t1 LIMIT 1;

这个SELECT语法把选定的列直接存储到变量。因此，只有单一的行可以被取回。且SQL变量名不能和列名一样。



##四、用户变量与局部变量

具体看参考文档[这里](http://dev.mysql.com/doc/refman/5.1/zh/language-structure.html#variables)

###1.用户变量：

用户变量能够在多个语句、存储过程或函数中传入。
用户变量与连接有关。也就是说，一个客户端定义的变量不能被其它客户端看到或使用。当客户端退出时，该客户端连接的所有变量将自动释放。

**形式：** `@var_name`

示例如下：

	mysql > SELECT 'Hello World' into @x;  
    mysql > SELECT @x;  
    +-------------+  
    |   @x        |  
    +-------------+  
    | Hello World |  
    +-------------+  
    mysql > SET @y='Goodbye Cruel World';  
    mysql > SELECT @y;  
    +---------------------+  
    |     @y              |  
    +---------------------+  
    | Goodbye Cruel World |  
    +---------------------+  
     
    mysql > SET @z=1+2+3;  
    mysql > SELECT @z;  
    +------+  
    | @z   |  
    +------+  
    |  6   |  
    +------+  
	# 可以用语句替代SET为用户变量分配值，分配符必须为:=而不能用=，因为在非SET语句中=被视为一个比较操作符：
	mysql> SET @t1=0, @t2=0, @t3=0;
	mysql> SELECT @t1:=(@t2:=1)+@t3:=4,@t1,@t2,@t3;
	+----------------------+------+------+------+
	| @t1:=(@t2:=1)+@t3:=4 | @t1  | @t2  | @t3  |
	+----------------------+------+------+------+
	|                    5 |    5 |    1 |    4 |
	+----------------------+------+------+------+


###2.局部变量

作用范围在begin到end语句块之间。在该语句块里设置的变量，declare语句专门用于定义局部变量。

*推荐阅读*：[**mysql变量使用总结**](http://www.cnblogs.com/wangtao_20/archive/2011/02/21/1959734.html)


##五、存储过程的流程控制

 完善中……

##六、应用实战

完善中……

##七、存储过程与函数的比较

MySQL的存储过程（stored procedure）和函数（stored function）统称为stored routines。它们的区别如下：
>1.函数只能通过return语句返回单个值或者表对象。而存储过程不允许执行return，但是通过out参数返回多个值。

>2.函数是可以嵌入在sql中使用的,可以在select中调用，而存储过程不行。
函数限制比较多，比如不能用临时表，只能用表变量．还有一些函数都不可用等等．而存储过程的限制相对就比较少

>3.一般来说，存储过程实现的功能要复杂一点，而函数的实现的功能针对性比较强。
当存储过程和函数被执行的时候，SQL Manager会到procedure cache中去取相应的查询语句，如果在procedure cache里没有相应的查询语句，SQL Manager就会对存储过程和函数进行编译。

>4.Procedure cache中保存的是执行计划 (execution plan) ，当编译好之后就执行procedure cache中的execution plan，之后SQL SERVER会根据每个execution plan的实际情况来考虑是否要在cache中保存这个plan，评判的标准一个是这个execution plan可能被使用的频率；其次是生成这个plan的代价，也就是编译的耗时。保存在cache中的plan在下次执行时就不用再编译了。

参考：[MySQL存储过程和函数的区别](http://www.gooseeker.com/cn/node/Fuller/2010061201)


##八、in/out/inout的区别

参考如下文章：[MySQL 存储过程参数用法 in, out, inout（转）](http://www.blogjava.net/nonels/archive/2009/04/22/233324.html)

>1.**`in:`**

>MySQL 存储过程 “in” 参数：跟 C 语言的函数参数的值传递类似， MySQL 存储过程内部可能会修改此参数，但对 in 类型参数的修改，对调用者（caller）来说是不可见的（not visible）。

>
	drop procedure if exists pr_param_in;
	create procedure pr_param_in
	(
	   in id int -- in 类型的 MySQL 存储过程参数
	)
	begin
	   if (id is not null) then
	      set id = id + 1;
	   end if;
	   select id as id_inner;
	end;
	set @id = 10;
	call pr_param_in(@id);
	select @id as id_out;
	mysql> call pr_param_in(@id);
	+----------+
	| id_inner |
	+----------+
	|       11 |
	+----------+
>	
	mysql> select @id as id_out;
	+--------+
	| id_out |
	+--------+
	| 10     |
	+--------+

>可以看到：用户变量 @id 传入值为 10，执行存储过程后，在过程内部值为：11（id_inner），但外部变量值依旧为：10（id_out）。

>**2.`out`:**

>MySQL 存储过程 “out” 参数：从存储过程内部传值给调用者。在存储过程内部，该参数初始值为 null，无论调用者是否给存储过程参数设置值。
>
	drop procedure if exists pr_param_out;
	create procedure pr_param_out
	(
	   out id int
	)
	begin
	   select id as id_inner_1;  -- id 初始值为 null
	   if (id is not null) then
	      set id = id + 1;
	      select id as id_inner_2;
	   else
	      select 1 into id;
	   end if;
	   select id as id_inner_3;
	end;
	set @id = 10;
	call pr_param_out(@id);
	select @id as id_out;
	mysql> set @id = 10;
	mysql> call pr_param_out(@id);
	+------------+
	| id_inner_1 |
	+------------+
	|       NULL |
	+------------+
>	
	+------------+
	| id_inner_3 |
	+------------+
	|          1 |
	+------------+
>	
	mysql> select @id as id_out;
	+--------+
	| id_out |
	+--------+
	| 1      |
	+--------+

>可以看出，虽然我们设置了用户定义变量 @id 为 10，传递 @id 给存储过程后，在存储过程内部，id 的初始值总是 null（id_inner_1）。最后 id 值（id_out = 1）传回给调用者。

>**3.`inout`:**

>MySQL 存储过程 inout 参数跟 out 类似，都可以从存储过程内部传值给调用者。不同的是：调用者还可以通过 inout 参数传递值给存储过程。
>
	drop procedure if exists pr_param_inout;
	create procedure pr_param_inout
	(
	   inout id int
	)
	begin
	   select id as id_inner_1;  -- id 值为调用者传进来的值
	   if (id is not null) then
	      set id = id + 1;
	      select id as id_inner_2;
	   else
	      select 1 into id;
	   end if;
	   select id as id_inner_3;
	end;
	mysql> set @id = 10;
>	
	mysql>
	mysql> call pr_param_inout(@id);
	+------------+
	| id_inner_1 |
	+------------+
	|         10 |
	+------------+
>	
	+------------+
	| id_inner_2 |
	+------------+
	|         11 |
	+------------+
>	
	+------------+
	| id_inner_3 |
	+------------+
	|         11 |
	+------------+
	mysql>
	mysql> select @id as id_out;
	+--------+
	| id_out |
	+--------+
	| 11     |
	+--------+
>
从结果可以看出：我们把 @id（10），传给存储过程后，存储过程最后又把计算结果值 11（id_inner_3）传回给调用者。 MySQL 存储过程 inout 参数的行为跟 C 语言函数中的引用传值类似。
>
**通过以上例子：如果仅仅想把数据传给 MySQL 存储过程，那就使用“in” 类型参数；如果仅仅从 MySQL 存储过程返回值，那就使用“out” 类型参数；如果需要把数据传给 MySQL 存储过程，还要经过一些计算后再传回给我们，此时，要使用“inout” 类型参数。**


##九、Python操作存储过程

完善中……

##十、小结

###1.存储过程的优势：

>(1).**增强了SQL语言的功能和灵活性**。存储过程可以用流控制语句编写，有很强的灵活性，可以完成复杂的判断和较复杂的运算。 而SQL命令则是一次编译一次使用，且一条条的执行，虽然可以通过连接、子查询等实现些高级的处理，但局限性是显而易见的。

>(2).**良好的编程规范**。存储过程被创建后，可以在程序中被多次调用，而不必重新编写该存储过程的SQL语句。而且可以随时对存储过程进行修改，对应用程序源代码毫无影响。 

>(3).**执行速度快**。如果某一操作包含大量的Transaction-SQL代码或分别被多次执行，那么存储过程要比批处理的执行速度快很多。因为存储过程是预编译的。在首次运行一个存储过程时查询，优化器对其进行分析优化，并且给出最终被存储在系统表中的执行计划。而批处理的Transaction-SQL语句在每次运行时都要进行编译和优化，速度相对要慢一些。 

>(4).**减少请求次数**。针对同一个数据库对象的操作（如查询、修改），如果这一操作所涉及的Transaction-SQL语句被组织程存储过程，那么当在客户计算机上调用该存储过程时，网络中传送的只是该调用语句，从而大大增加了网络流量并降低了网络负载。 

>(5).**更加安全机可靠**。系统管理员通过执行某一存储过程的权限进行限制，能够实现对相应的数据的访问权限的限制，避免了非授权用户对数据的访问，保证了数据的安全。 

###2.存储过程的使用场景：

(1).不同的编程语言应用在同一数据库时。

(2).不同平台上运行多客户应用程序且需要执行相同的数据库操作之时。

(3).控制对数据库权限操作和安全管理的需求时

(4).需要解决性能和服务器负载问题时

(5).封装特定功能时

等等……

###3.注意事项

(1).存储程序需要在mysql数据库中有proc表。这个表在MySQL 5.1安装过程中创建。如果你从早期的版本升级到MySQL 5.1 ，请确定更新你的授权表以确保proc表的存在。

	mysql> use mysql;
	....
	mysql> show tables;
	+---------------------------+
	| Tables_in_mysql           |
	+---------------------------+
	| columns_priv              |
	| db                        |
	| func                      |
	| help_category             |
	| help_keyword              |
	| help_relation             |
	| help_topic                |
	| host                      |
	| proc                      |
	| procs_priv                |
	| tables_priv               |
	| time_zone                 |
	| time_zone_leap_second     |
	| time_zone_name            |
	| time_zone_transition      |
	| time_zone_transition_type |
	| user                      |
	+---------------------------+
	17 rows in set (0.01 sec)

我们可以打开看一看(如下是我的)：

![](http://images.cnblogs.com/cnblogs_com/BeginMan/486940/o_sql1.jpg)

(2).权限问题：

创建存储子程序需要CREATE ROUTINE权限；提醒或移除存储子程序需要ALTER ROUTINE权限；执行子程序需要EXECUTE权限。



##十一、参考：

[1.Mysql官方文档](http://dev.mysql.com/doc/refman/5.1/zh/stored-procedures.html)

[2.MySQL存储过程详解](http://xdj651897373-126-com.iteye.com/blog/1819924)

[4.python调用MySql存储过程](http://www.cnblogs.com/luoshulin/archive/2009/10/28/1591385.html)

