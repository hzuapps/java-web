<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Cur Time</title>
  </head>
  
  <body>
    <h1>当前时间为</h1>
    <%
    	Date curTime = new Date();
    	out.print("<h2 align='center'>" + curTime.toString() + "</h2>");
     %>
  </body>
  <script>
  	
  </script>
</html>
