<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>时间显示</title>
    <meta http-equiv="refresh" content="1">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
<style type="text/css">
body
{
	padding:  0px;
	margin: 0px;
}
</style>
  <body>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
	<table align="left" height="20"><tr><td>
	<jsp:useBean id="now" class="java.util.Date"></jsp:useBean>
	<jsp:useBean id="date" class="Bean.Bean5" scope="application"></jsp:useBean>
	当前日期时间为:<jsp:getProperty name="date" property="datetime"></jsp:getProperty>
	<jsp:getProperty name="date" property="week"></jsp:getProperty>
	<c:choose>
		<c:when test="${now.hours>=0 && now.hours<5}">
			凌晨     
		</c:when>
		<c:when test="${now.hours>=5&&now.hours<8}">
			早上     
		</c:when>
		<c:when test="${now.hours>=8&&now.hours<11}">
			上午     
		</c:when>
		<c:when test="${now.hours>=11&&now.hours<13}">
			中午     
		</c:when>
		<c:when test="${now.hours>=13&&now.hours<17}">
			下午     
		</c:when>
		<c:otherwise>
			晚上     
		</c:otherwise>
	</c:choose>
		${now.hours}时${now.minutes}分
		</td>
		</tr>
		</table>	 
  </body>
</html>
