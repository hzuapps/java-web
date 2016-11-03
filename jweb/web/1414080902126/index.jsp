<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>登录界面</title>
	


  </head>
  
  <body >
  	<h3 align="center">管理员账号登录</h3>
  	<form action="Se1414080902126" method="post">
  	<table  align="center">
  	<tr><td>昵称：</td><td><input type="text" name="username"></td></tr>
  	
  	
		<tr><td>密码：
		</td>
			<td>
				<input type="password" name="userpwd" cols="40">
			</td>
		</tr>
		
			<td>
			<input type="submit"  value="登录" />
			<input type="reset"  value="取消"/>
			</td>
		</tr>
			</table>
			</form>
			当前时间是：<%= new Date().toLocaleString() %><br>
			<hr>		
  </body>
</html>
