<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Left-x.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	</head>
 <body bgcolor="#FFFF33">
  <p><font size="5">设置个人信息</font></p>
  <p><a href="link.jsp"><font size="4">*联系方式</font></a></p>
  <p><font size="4">*账号信息</font></p>
  <p><a href="passward.jsp"><font size="4">*修改密码</font></a></p>
   <img src="ex.jpg"width="200"height="100"align="middle" >
 
  </body>
</html>
