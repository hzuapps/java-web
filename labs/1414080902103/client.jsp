<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page import="edu.hzu.javaweb.labs.se1414080902103.StuDetails"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>学生签到表2</title>
    
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
  
     
  
     
         <c:forEach var="StuDetails" items="${StuDetails}">
     <c:if test="${not empty StuDetails.name && not empty StuDetails.id && not empty StuDetails.date && not empty StuDetails.note}">
        <center><c:out value="签到已录入"/></center><br>
    <center>   姓名：${StuDetails.name}<br> 
         学号：${StuDetails.id} <br>
         日期： ${StuDetails.date} <br>
        缺勤情况： ${StuDetails.note} <br></center>
        </c:if>
   <c:if test="${empty StuDetails.name || empty StuDetails.id || empty StuDetails.date || empty StuDetails.note}">
     <center><c:out value="签到失败"/></center><br>
        <center> 信息不能为空!</center>
        </c:if>
     </c:forEach><br>
    


 
  </body>
</html>
