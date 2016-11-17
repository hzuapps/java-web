<%@ page language="java" import="java.util.*" pageEncoding="utf8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
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
<form action="servlet/Se1414080902116Servlet" method="post" >

    <h4 align="center">会员登录界面</4></br>
请输入用户名:<input type="text" name="username"/></br>
请输入密码:<input type="password" name="userpwd"/></br>
<blockquote>
<input type="submit" value="提交" name="button1">
<input type="submit" value="重置" name="button2"></br>

<form actin="zhuce.jsp" method="post">
你还没有注册，你是否想要注册一个账号：</br>
<a href="zhuce.jsp">注册</a>

</blockquote>
  </body>
</html>
