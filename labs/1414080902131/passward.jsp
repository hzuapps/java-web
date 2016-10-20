<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'passward.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script language="javascript">
function but(){
window.alert("修改密码成功！");}
</script>
  </head>
  
  <body bgcolor="#FFFF33">
    <h1>修改个人密码</h1>
    <font size="4">原密码：</font>
    <input type="password"name="mima1"id="paymentPassword1"><br>
    <font size="4">新密码：</font>
    <input type="password"name="mima2"id="paymentPassword2"><br>
    <font size="4">确认新密码：</font>
    <input type="password"name="mima3"id="paymentPassword2"><br>
    <input type="button"value="提交"onclick="but()">
  </body>
</html>
