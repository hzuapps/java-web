<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'return.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body style="background-color:#66FFFF">
    <%  request.setCharacterEncoding("UTF-8");
    String str1=request.getParameter("money1");
    String str2=request.getParameter("qixian");
    String str3=request.getParameter("repayment");
    String str4=request.getParameter("mima");
     %>
     <div align="center">
   <font face="楷体" size=4 color=blue>
   您输入的信息为：<br>
   借款数目：<%=str1 %><br>
   借款期限：<%=str2 %><br>
   还款方式：<%=str3 %><br>
   支付密码：<%=str4 %>
 </font> 
 </div>
  </body>
</html>
