<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>学生签到登记表</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
      <frameset rows="10%,*"> 
      <frame title="title" src="Title.jsp" scrolling="No">
      <frameset cols="50%,*">
    	<frame src="MyJsp.jsp" scrolling="no">
    
    		
    		<frame scrolling="yes" name="right">
    	</frameset>
    	</frameset>
 
  <body>
   <center>学生签到登记表</center>



  </body>
  

  
</html>
