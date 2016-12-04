<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>上传文件</title>
</head>
<link rel="stylesheet" type="text/css" href="css/File_Manage.css">
<body>
	<div id="head">
		<div id="head_left">
			<a class="title_text" href="File_Manage_Servlet">主页</a>
			<a class="title_text" href="">文件</a>
			<a class="title_text" href="">上传</a>
			<a class="title_text" href="">(敬请期待)</a>
		</div>
		
		<div id="head_right">
			<img id="head_right_img" src="src/head.png" alt="usrename">
		</div>
		
	</div>
	<div id="content">
		<!-- 如果上传文件,必须使用此句 enctype="multipart/form-data",表示不对文件进行编码
		action值前面不加"/"表示项目根目录(即项目名),加"/"到主机根目录 -->
		<form action="LincoServlet" id="content_center" method="post" enctype="multipart/form-data">
			<input type="text" value="文件名" /><br>
			<input type="text" value="文件描述"/><br>
			<input type="file"/>
			<input type="submit" value="提交">
		</form>
	</div>
	<div id="tail"></div>
</body>
</html>