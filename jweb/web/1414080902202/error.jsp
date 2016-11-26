<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
<meta charset="utf-8">
 <!-- 新 Bootstrap 核心 CSS 文件 -->
 <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
 <!-- 可选的Bootstrap主题文件（一般不用引入） -->
 <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">
 <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
 <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
 <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
 <script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
 <style type="text/css">
 body{
   background-color:#FFCC00;
 }
.text2{border:3px;width:350px;height:50px;font-size:16px;line-height:1.6;}
.bt{
      width:100px; 
    }
 </style>
 <head>
<title>登录验证出错页面！</title>
</head>
<body bgcolor="yellow">
	<p >
		<font align="center"size="6"color="#FFFFFF"><b><%=request.getParameter("textfield3") %>:登录失败！</b></font>
	</p>
</body>

