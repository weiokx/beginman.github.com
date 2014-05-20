---
layout: post
title: 一款强大的工具实现Django内html转pdf
category: Django
tagline: by BeginMan
tags: [python,django,pdf]
description: Html转pdf,Django,Pdfcrowd
---
##介绍
Pdfcrowd是一款chrome下的插件，能够实现将html页面转换成pdf。其[官网](http://pdfcrowd.com/)提供了在线处理和功能强大针对多编程语言的[API](http://pdfcrowd.com/html-to-pdf-api/)
##django实现

	import pdfcrowd
	from django.http import HttpResponse

	def generate_pdf_view(request):
	    try:
	        # create an API client instance
	        client = pdfcrowd.Client("username", "apikey")

	        # convert a web page and store the generated PDF to a variable
	        pdf = client.convertURI("http://www.google.com")

	         # set HTTP response headers
	        response = HttpResponse(mimetype="application/pdf")
	        response["Cache-Control"] = "max-age=0"
	        response["Accept-Ranges"] = "none"
	        response["Content-Disposition"] = "attachment; filename=google_com.pdf"

	        # send the generated PDF
	        response.write(pdf)
	    except pdfcrowd.Error, why:
	        response = HttpResponse(mimetype="text/plain")
	        response.write(why)
	    return response

##Python实现

	import pdfcrowd

	try:
	    # create an API client instance
	    client = pdfcrowd.Client("username", "apikey")

	    # convert a web page and store the generated PDF into a pdf variable
	    pdf = client.convertURI('http://www.google.com')

	    # convert an HTML string and save the result to a file
	    output_file = open('html.pdf', 'wb')
	    html="<head></head><body>My HTML Layout</body>"
	    client.convertHtml(html, output_file)
	    output_file.close()

	    # convert an HTML file
	    output_file = open('file.pdf', 'wb')
	    client.convertFile('/path/to/MyLayout.html', output_file)
	    output_file.close()


	except pdfcrowd.Error, why:
	    print 'Failed:', why

