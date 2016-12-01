<%@ page language="java" import="java.util.*,edu.hzu.javaweb.labs.se1414080902238.Client" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" %>
<html>
  <head>
    <title>显示结果页面</title>
  </head>
  <body>
  	<%request.setCharacterEncoding("utf-8"); %>
    <%=request.getAttribute("outputMessage")%>
    <hr>
    	定单记录如下：
    <hr>
    <table border="1">
    	<tr><th>客户名</th><th>电话号码</th><th>所购车辆</th><th>付款情况</th></tr>
    	<c:forEach var="order" items="${orderList}">
    		<tr><td><c:out value="${order.name }"/></td><td>${order.phone }</td><td>${order.car }</td><td>${order.hadPaid }</td></tr>
    		</c:forEach>
    </table>
  </body>
</html>
