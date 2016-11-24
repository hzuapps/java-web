<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core"  prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户户籍提交页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  
  <body>
    <form action="SetUser" method="post">
   <table>
<tr><td>姓名：</td><td><input type="text" name="name"></td></tr>
<tr><td>性别：</td><td><input type="text" name="sex"></td></tr>
<tr><td>身份证：</td><td><input name="id" maxlength="30"></td></tr>
<tr><td>出生日期：</td><td><input name="brithdate"></td></tr>
 <tr><td>用户家庭信息：
 <td colspan="2">
 <textarea name="information" rows="5"cols="50"></textarea></td>
 </tr>
 <tr><td><input type=submit value="提交"> </td></tr>
 </table>
   </form>
  </body>