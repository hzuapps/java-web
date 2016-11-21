<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/11/19
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title></title>
</head>
<jsp:useBean id="user" class="se1414080902124.User" scope="request"/>
<body>
test<br/>

<c:if test="${user.name!=null && user.name.length()>0}">
    <c:out value="user各属性为:"> </c:out>
      <c:forEach items="user" >
          <div>${user.name}</div>
          <div>${user.id}</div>
          <div>${user.clazz}</div>
          <div>${user.city}</div>
          <div>${user.salary}</div>
      </c:forEach>
</c:if>
</body>
</html>
