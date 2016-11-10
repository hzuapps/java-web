<%@ page pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	session.setAttribute("index",request.getParameter("index"));
%>
<html>
	<head>
		<title><c:out value="${content.get(index).getTitle()}" /></title>
	    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
		<link rel='stylesheet' href='css/display.css'>
	</head>
	<body>
		<div class="right-top">
			<p align="right">欢迎&nbsp;<a href=""><c:out value="${username}" /></a></p>
			<p align="right"><a href="home.jsp" >返回主页</a></p>
		</div>
		<h2 id="title"><c:out value="${content.get(index).getTitle()}" /></h2>
		<hr style="border-top:1px solid blue" >
		<div id="mid-block" >
			<textarea readonly style="width:100%;height:100%"><c:out value="${content.get(index).getText()}" /></textarea>
		</div>
	</body>
</html>