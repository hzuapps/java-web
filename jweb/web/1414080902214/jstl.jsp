<%@ page language="java" import="java.util.Calendar" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'index.jsp' starting page</title>

  </head>
  
  <body>
   <h4>依据当前时间来输出不同的问候语</h4>
   <%Calendar rightNow=Calendar.getInstance();
   Integer Hour=new Integer(rightNow.get(Calendar.HOUR_OF_DAY));
   request.setAttribute("hour",Hour);
    %>
    <h5>采用单分支持标签实现</h5>
    <c:if test="${hour>=0&&hour<=11}">上午好！</c:if>
   <c:if test="${hour>=12&&hour<=17}">下午好！</c:if>
    <c:if test="${hour>=18&&hour<=23}">晚上好！</c:if>
    <h5>采用多分支标签实现</h5>
    <c:choose>
    <c:when test="${hour>=0&&hour<=11}">上午好！</c:when>
    <c:when test="${hour>=12&&hour<=17}">下午好</c:when>
    <c:otherwise>晚上好！</c:otherwise>
    </c:choose>
  </body>
</html>
