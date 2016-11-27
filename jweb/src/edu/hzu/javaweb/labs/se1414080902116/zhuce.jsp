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
  <form action="doSubmit.jsp" method="post">
  <head><title>  注册页面</title></head>
  <% request.setCharacterEncoding("utf8"); %>
 用户名：<input type="txet" name="name" value="abc"></br>
密码:<input type="password" name="userPwd" value="123"></br>
  性别：<td><input type="radio" name="sex" value="男" checked/>男
  <input type="radio" name="sex" value="女" checked/>女</td></br>
   电话：<input type="text" name="regTelephone"></br>
  邮箱地址：<input type="txet" name="email"></br>
  
  简介<textarea rows="2" cols="30" name="intro"></textarea></br>
<tr><td colspan="3" align="center" height="40">
<input type="submit" value="提交"/>  <input type="reset" value="重置"/>
    </form>
    </body>
</html>