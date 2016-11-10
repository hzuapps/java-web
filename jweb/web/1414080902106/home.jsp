<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%!
	String title;
	String content;
	String username;
%>
<%
	title = (String)session.getAttribute("title");
	content = (String)session.getAttribute("content");
	username = (String)session.getAttribute("username");
	if(title == null)
		title = "没有帖子！";
	if(content == null)
		content = "";
%>
<!-- 因为是实验，所以只能发一个帖子 -->
<html>
	<head>
		<title>欢迎<%= username %>浏览帖子</title>
	</head>
	<body>
		<p align="right">欢迎&nbsp;<a href=""><%= username %></a></p>
		<form method="post" action="content.jsp"><input type="submit" value="发帖"></form>
		<h2 id="title"><%= title %></h2>
		<hr>
		<div>
			<textarea readonly rows="20" cols="100"><%= content %></textarea>
		</div>
	</body>
</html>