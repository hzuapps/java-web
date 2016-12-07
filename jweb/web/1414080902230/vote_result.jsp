<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
    <title>投票结果</title>
  </head>
  <body>
  <h2>投票结果:</h2>
  <%request.setCharacterEncoding("utf-8"); %>
   	<c:forEach var="output" items="${param.candidate}">
   		<c:out value="${output}"></c:out>
   	</c:forEach>
  </body>
</html>
