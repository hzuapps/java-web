<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>网络教学登录页面系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<style type="text/css">
	h1{color:red;text-decoration:underline;font-weight:bold;font-size:25px;}
	h2{font-size:20px;color:blue;}
 	</style>
  </head>
  
  <body>
<form method="post" action="Loading.jsp">
	<div id="01" style=" position:absolute; width:100%; height:100%; background-color:#33CC99">
	<table border="0" align="center" width="600">
	<tr><td colspan="3" align="center" height="20"><h1>Welcome, visiter!</h1></td></tr>
	
	<tr><td align="right"><h2>UserName:*</h2></td>
		<td align="center"><input type="text" name="Username"></td>
		<td><h2>请输入用户名</h2></td>
	</tr>
	
	<tr><td align="right"><h2>PassWord:*</h2></td>
		<td align="center"><input type="text" name="Password"/></td>
		<td><h2>请输入密码</h2></td>
	</tr>
	
	<tr><td align="right"><h2>选择身份:*</h2></td>
		<td align="center"><input type="radio" name="UserID" value="学生" checked/>学生
		<input type="radio" name="UserID" value="教师"/>教师</td>
		<td> <h2>请选择身份进行登录</h2>
		<blockquote>
		<input type="submit" name="提交" name="button1">
		<input type="reset" name="重置" name="button2">
		</blockquote>
		</td>
		
   </tr>
   </table>
</div>

	
</form>
<%
   
//   session.setAttribute("usern","admin"); 
 //  session.setAttribute("passw","123"); 
 //s  session.setAttribute("uid",""s); 
   
 %>
  </body>
</html>