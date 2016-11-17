<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Second.jsp' starting page</title>
    
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
    
   
    <c:choose>
    <c:when test="${fn:contains(user,'admin')}">你好，管理员！</c:when>
    <c:otherwise>  <c:out value="${user}" default="wrong"></c:out> ,你好，欢迎来到惠州学院图书馆！</c:otherwise>
    </c:choose>
    <br>
    <div >
    <ul>
     根据所借图书，推荐阅读书籍如下列：
     <c:forEach var="name" items="《淡定的人生不寂寞》,《你能行》,《口才的魅力》" begin="0" step="1">
     <li>
    <c:out value="${name}"></c:out>
   </li>
    </c:forEach>
     </ul>
   
    </div>
    
    
   
   
  </body>
</html>
