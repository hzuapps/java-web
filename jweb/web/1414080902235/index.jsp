<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,java.text.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登陆页面</title>
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
  <form action="servlet/indexcheck" method="post">
   <table border="1" align="center" width="600">
   <tr><td colspan="3" align="center" height="40">登陆</td></tr>
   <tr><td align="right">用户名：*</td>
   <td><input type="text" name="username"/></td>
   <td>输入账号！</td>
   </tr>
   <tr><td align="right">密码：*</td>
   <td><input type="password" name="userpwd"/></td>
   <td>输入密码！</td>
   </tr>
   <tr><td colspan="3" align="center" height="40">
   <input type="submit" value="登陆"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   <input type="reset" value="取消"/>
   </td>
   </tr>
   </table>
  </form>
  <a href="register.jsp">尚未注册？点击前往。</a>
<small>
 	    	<%
 			   Date now=new Date();
 			  SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd");
			   out.print( "现在时间是："+now + ft.format(now));
 			%>
 </small>
  </body>
</html>
