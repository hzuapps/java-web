<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>显示结果</title>
    
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
          <%request.setCharacterEncoding("UTF-8"); %>
    厂商          ：<%=request.getAttribute("Manu") %><br>
    级别          ：<%=request.getAttribute("Lev") %><br>
    发动机          ：<%=request.getAttribute("Eng") %><br>
   变速箱          ： <%=request.getAttribute("Gea") %><br>
   长*宽*高(mm)    ： <%=request.getAttribute("Siz") %><br>
     车身结构           ：<%=request.getAttribute("Bod") %><br>
    最高车速(km/h)    ：<%=request.getAttribute("Max") %><br>
   官方0-100km/h加速(s)： <%=request.getAttribute("Hun") %><br>
    工信部综合油耗(L/100km)：<%=request.getAttribute("Ga") %><br>
    
  </body>
</html>
