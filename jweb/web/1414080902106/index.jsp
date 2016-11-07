<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%!
	String title;
	String content;
%>
<%
	title = (String)session.getAttribute("title");
	content = (String)session.getAttribute("content");
	if(title == null)
		title = "没有帖子！";
	if(content == null)
		content = "";
%>
<!-- 因为是实验，所以只能发一个帖子 -->
<html>
	<head>
		<title>浏览帖子</title>
		<script type="text/javascript" src="index.js"></script>
	</head>
	<body>
		<form method="post" action="content.jsp"><input type="submit" value="发帖"></form>
		<h2 id="title"><%= title %></h2>
		<hr>
		<div>
			<p id="context"><%= content %></p>
		</div>
	</body>
</html>