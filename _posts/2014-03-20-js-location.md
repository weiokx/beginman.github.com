---
layout: post
title: 前端效率提升之js window.locatin对象
category: js
---
##效率从认知开始
在开发中对于js而言接触最多的就是`location.href`,比如如下一个需求：在url传参来指定某个动作如执行一个按钮：可能会这样写：

	var url = window.location.href;
	// eg.Arguement: ?is_test=1
	if(url.match(/is_test/)){
		// do something
	}



在我们了解了window.locatin对象后，可有如下了解：

>window.location可简写为location.

>window.location.href 可简写为window.location.

>window.location.assgin('..') 等价于 window.location='..'

>window.location.reload();强刷页面

>window.location.replace('http://example.com/#' + 'someCode'); 替换并跳转。

上面的需求可以location.search来简化：

	function sendData (sData) {
	  window.location.search = sData; // 添加URL参数
	}
	
	// in html: <button onclick="sendData('Some data');">Send data</button>



##参考是很重要的：

1.[**JS代码的window.location属性详解**](http://www.5icool.org/a/201105/a564.html)


2.[**Window.location**](https://developer.mozilla.org/en-US/docs/Web/API/Window.location)

**顺便推荐一个网站：[MDN Shared knowledge for the Open Web](https://developer.mozilla.org/en-US/)**