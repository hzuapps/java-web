<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'insert.jsp' starting page</title>
    
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
	<form action="InsertServlet" method="post">
	<table border="0" width="238" height="252">
	<tr><td>姓名</td><td><input type="text" name="name" ></td></tr>
    <tr><td>身份证</td><td><input type="text" name="idcard" ></td></tr>
    <tr><td>卡号</td><td><input type="text" name="card" ></td></tr>
    <tr><td>手机号</td><td><input type="text" name="phonenumber" ></td></tr>
	</table>
	<input type="submit" value="添加">
	</form>
  </body>
</html>
