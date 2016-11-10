<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'querymoney.jsp' starting page</title>
    
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
    	<form action="/qiandaoxitong/servlet/QueryMoneyServlet" method="post">
    	<h2>查询营业额模块</h2>
    		加盟商姓名：<input type="text" name="username">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;		<input type="submit" value="查询">
    	</form>
    	<form action="/qiandaoxitong/servlet/InsertMoneyServlet" method="post">
    	<h2>添加营业额模块</h2>
    		加盟商姓名：<input type="text" name="username" id="username">
    		<br>
    		金额：<input type="text" name="money" id="money">
    		<br>
    		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="添加">
    	</form>
  </body>
</html>
