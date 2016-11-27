<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'new.jsp' starting page</title>
    
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
 <form action="submit.jsp" method="post">
 <table border="0" width="238" height="252">
 <tr><td>id</td><td><input type="text" name="id"></td></tr>
 <tr><td>名称</td><td><input type="text" name="name"></td></tr>
 <tr><td>size</td><td><input type="text" name="size"></td></tr>
 <tr><td>数量</td><td><input type="text" name="num"></td></tr>
 <tr align="center">
 <td colspan="2">
 <input type="submit" value="新建">&nbsp;&nbsp;&nbsp;
 </td>
 </tr>
 </table>
 </form>
  </body>
</html>
