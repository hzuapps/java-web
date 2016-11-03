<%@ page language="java" import="java.util.*,java.sql.*,JDBC_package.JDBC_package" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登录界面</title>
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
<form action="" method="post" id="form_enter" name="form_enter">
<table border="1 solid black" align="center">
	<tr>
	<td>
<h3 align="center">学院交流招聘管理员登录界面</h3>
<hr width="200"/>
<table align="center">
	<tr>
		<td>帐号：</td>
		<td><input type="text" id="account" name="account"/></td>
	</tr>
	<tr>
		<td>密码：</td>
		<td><input type="password" id="password" name="password"/></td>
	</tr>
	<tr>
		<td align="center"><input type="button" value="登录" id="enter" onclick=f_enter() /></td> 
		<td align="center"><input type="button" value="注册" id="register" onclick="location.replace('register.jsp')" /></td>
	</tr>
</table>
	</td>
	<tr>
</table>
</form>
</body>
</html>
<script type="text/javascript" src="http://cdn.bootcss.com/jquery/3.1.1/jquery.js"></script>
<script type="text/javascript">
   function f_enter()
   {
   		if(form_enter.account.value =="")
   		{
   			alert("请输入账号！");
   		}
   		else if(form_enter.password.value =="")
   		{
   			alert("请输入密码!");
   		}
   		else
   		{
   			form_enter.action="transfer.jsp";
   			form_enter.submit();
   		}
   }
</script>