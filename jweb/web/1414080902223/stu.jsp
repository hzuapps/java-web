<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>students information</title>
    
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
  	<center>
	<font color=DeepSkyBlue size=5><b>
	<i>欢迎来到成绩查询系统</b></i>
	</font></center>
	<hr>
	
	选择学期：<br>&nbsp;&nbsp;
	<select size="1" name="list">
		<option value="1">2016~2017第一学期</option>
		<option value="2">2016~2017第二学期</option>
	</select>
	
	<hr><input type="submit" value="查询">
  </body>
</html>
