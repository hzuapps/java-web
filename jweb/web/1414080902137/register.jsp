<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>注册</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
	<form action="se1414080902137" method="post">
	请输入用户名:<input type="text" name="username"><br>
	请输入密码：<input type="text" name="password"><br>
	<input type ="submit" value="登录"/>
	<input type ="reset"/>
	</form>
	<%session.setAttribute("u_name", request.getParameter("username")); %>
	<a href="admin/login.jsp">访问fiter保护文件</a>
  </body>
</html>
