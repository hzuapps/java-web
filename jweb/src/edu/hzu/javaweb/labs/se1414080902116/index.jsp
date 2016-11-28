<%@ page language="java" import="java.util.*,bean.JDBC,java.sql.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

//String id = request.getParameter("id");


%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加记录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	
	-->
	<script src="js/index.js"></script>
  </head>

  <body>
  <form action="#" method="post" id="form1">
  查询/删除
  <hr>
  名字:<input type="text" name="name1">
 	<input type="submit" value="查询" onclick="f_select()">&nbsp;
 	<input type="submit" value="删除" onclick="f_delete()">
 	<br>
 	<hr>
 增加<br>
  名字:<input type="text" name="name"><br>
 ID:<input type="text" name="id"><br>
 roomnumber:<input type="text" name="roomnumber"><br>
 telephone:<input type="text" name="telephone"><br>
 assumption:<input type="text" name="assumption"><br>
 	<input type="submit" value="插入" onclick="f_insert()">
  </body>
</html>
