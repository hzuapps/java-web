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
  <form action="see1.jsp" method="post">
  <% request.setCharacterEncoding("utf8"); %>
 现在出出租的房间有：<input type="text" name="c1" value="301" size="3">,
 <input type="text" name="c2" value="302" size="3">,
 <input type="text" name="c3" value="303" size="3">,
<input type="text" name="c4" value="304" size="3"></br>
增加已经出租的房间:<input type="text" name="c5"  size="3"></br>

 你要删除的出租的房间有：   <input type="text" name="c6"  size="3">
 <input type="submit" value="提交" name="button1">
<input type="submit" value="重置" name="button2"></br>


    
    
    

  </body>
</html>