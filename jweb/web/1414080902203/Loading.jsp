<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Loading</title>
    
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
    <%
    String username=request.getParameter("Username");
	String password=request.getParameter("Password");
	String uid=request.getParameter("UserID");
	session.setAttribute("usern",username);
	session.setAttribute("passw",password);	
	session.setAttribute("userid",uid);			
	%>
	<form method="post" action="Show.jsp">
	<input type="submit" value="Sure" name="button1">
	
	</form>
  </body>
</html>
