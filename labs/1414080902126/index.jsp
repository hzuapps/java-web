<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>注册界面</title>
	
      <script src="http://code.jquery.com/jquery.js"></script>
    <script language="javascript" src="test.js"></script>

  </head>
  
  <body >
  	<h3 align="center">管理员账号登录</h3>
  	<form name="stu" action="">
  	<table  align="center">
  	<tr><td>昵称：</td><td><input type="text" name="stuName"></td></tr>
  	<tr><td>性别：</td>
  		<td><input type="radio" name="stuSex" checked="checked">男
  		<input type="radio" name="stuSex">女
  		</td>
    </tr>
  	
		<tr><td>密码：</td><td><input type="password" name="4" cols="40"></td></tr>
		
			<td><input type="submit" value="登录" onclick="test()"><input type="reset" value="取消"></td>
			</tr>
			</table>
			</form>
			当前时间是：<%=new Date().toLocaleString() %><br>
			<hr>
			
			
  </body>
</html>
