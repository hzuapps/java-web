<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登录页面</title>
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
  <h4 align="center">会员登录界面</4></br>
<img src="file:///C:/Users/Administrator/Desktop/001.png"  width="600xp"  height="300xp"> </br>
<form action="servlet/Se1414080902116Servlet" method="post" >
请输入用户名:<input type="text" name="username"/></br>
请输入密码:<input type="password" name="userpwd"/></br>


<input type="submit" value="登录"/>
<input type="reset">
</form>
  
  </body>
</html>
