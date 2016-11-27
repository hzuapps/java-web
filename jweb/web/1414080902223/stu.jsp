<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
	
	<% Calendar dateFormat = Calendar.getInstance();
	   Integer Year = new Integer(dateFormat.get(Calendar.YEAR));
	   Integer Month = new Integer(dateFormat.get(Calendar.MONTH));
	   Integer Day = new Integer(dateFormat.get(Calendar.DAY_OF_MONTH));
	   Integer Hour = new Integer(dateFormat.get(Calendar.HOUR_OF_DAY));
	   Integer Minute = new Integer(dateFormat.get(Calendar.MINUTE));
	   Integer Second = new Integer(dateFormat.get(Calendar.SECOND));
	   request.setAttribute("year",Year);
	   request.setAttribute("month",Month);
	   request.setAttribute("day",Day);
	   request.setAttribute("hour",Hour);
	   request.setAttribute("minute",Minute);
	   request.setAttribute("second",Second);
	%>
		
	<c:out value="${year }"></c:out>年
	<c:out value="${month+1 }"></c:out>月
    <c:out value="${day }"></c:out>日&nbsp;&nbsp;
    <c:out value="${hour }"></c:out>:
    <c:out value="${minute }"></c:out>:
    <c:out value="${second }"></c:out>&nbsp;&nbsp;
	
	<font color=green>
	<c:if test="${hour>=0 && hour<=4 }">晚上好！</c:if>
	<c:if test="${hour>=5 && hour<=11 }">上午好！</c:if>
	<c:if test="${hour>=12 && hour<=13 }">中午好！</c:if>
	<c:if test="${hour>=14 && hour<=17 }">下午好！</c:if>
	<c:if test="${hour>=18 && hour<=23 }">晚上好！</c:if>
	</font>
	
	<hr>选择学期：<br>&nbsp;&nbsp;
	<select size="1" name="list">
		<option value="1">2016~2017第一学期</option>
		<option value="2">2016~2017第二学期</option>
	</select>
	
	<hr><input type="submit" value="查询">
  </body>
</html>
