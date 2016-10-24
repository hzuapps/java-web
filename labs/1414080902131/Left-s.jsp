<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Left-s.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body bgcolor="#009900">
    <p><font size="5">其他服务</font></p>
    <p><font size="4">*还款服务</font></p>
    <p><a href="credit.jsp"><font size="4">*查询信用等级</font></a></p>
    <p><font size="4">*优惠通知</font></p>
    <font color="#AF0000">
<%
for(int i=1;i<4;i++){
for(int j=1;j<=i;j++){
if(i==1&&j==1)
out.println("I"+" "+"*");
else if(i==2)
out.println("a"+" "+"m"+" "+"*");
else out.println("B"+" "+"e"+" "+"e"+" "+"*");}
out.println("<br/>");
}
 %>
 </font>
  </body>
</html>
