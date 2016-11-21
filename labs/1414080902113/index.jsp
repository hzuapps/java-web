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
    
    <title>My JSP '1.jsp' starting page</title>
    
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

   <form action="BookServlet" method="post">
   <table>
   <tr><td>书籍名称：</td><td><input name="name"></td></tr>
<tr><td>作者：</td><td><input name="writer"></td></tr>
<tr><td> 出版日期：</td><td><input name="date"></td></tr>
<tr><td>出版社：</td><td><input name="publish"></td></tr>
 <tr><td>主要内容：</td><td><input name="main"></td></tr>
 <tr><td><input type=submit value="添加书籍"> </td></tr>
 </table>
   </form>
  </body>
</html>
