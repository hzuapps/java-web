<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Calendar" %>
<%--
  Created by IntelliJ IDEA.
  User: yuan
  Date: 2016/11/21
  Time: 14:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title></title>
</head>
    <%
        Calendar rightNow = Calendar.getInstance();
        Integer Hour=new Integer(rightNow.get(Calendar.HOUR_OF_DAY));
        request.setAttribute("hour", Hour);

        String[] strs = new String[]{"聊天信息1","聊天信息2","聊天信息3","聊天信息4","聊天信息5","聊天信息6","聊天信息7"};
        request.setAttribute("strs",strs);
    %>
    <c:choose>
        <c:when test="${hours>=0 && hours<=11}"><p>早上好</p></c:when>
        <c:when test="${hours>=12 && hours<=17}"><p>下午好</p></c:when>
        <c:otherwise><p>晚上好</p></c:otherwise>
    </c:choose>
    <c:forEach var="item" items="${strs}">
          <c:out value="${item}"></c:out><br/><br/>
    </c:forEach>

</body>
</html>
