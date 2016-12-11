<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>发布笔记</title>
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">
<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
</head>
<body>
	<form action="insert2.jsp" method="post">
	<tr><td>笔记名:</td><td><input type="text" name="id"></td></tr><br>
	内容:<textarea rows="3" cols="20" name="text"></textarea>
	</form>
	<tr align="center">
	<td colspan="2">
	<input type="submit" value="发布">&nbsp;&nbsp;
	<input type="reset" value="取消">
	</td>
	</tr></form>
</body>
</html>
