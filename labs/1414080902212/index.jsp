<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>上传文件</title>
</head>
<link rel="stylesheet" type="text/css" href="css/File_upload.css">
<body>
	<div id="head">
		<div id="head_left">
			<a class="title_text" href="">主页</a>
			<a class="title_text" href="">文件</a>
			<a class="title_text" href="">上传</a>
			<a class="title_text" href="">(敬请期待)</a>
		</div>
		<div id="head_right">
			<img id="head_right_img" src="src/head.png" alt="usrename">
		</div>
	</div>
	<div id="content">
		<form action="" id="content_center">
			<input type="text" value="文件名" /><br>
			<input type="text" value="文件描述"/><br>
			<input type="file" />
		</form>
	</div>
	<div id="tail"></div>
</body>
</html>