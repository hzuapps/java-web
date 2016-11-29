<%@ page import="edu.hzu.javaweb.labs.se1414080902124.Student" %>
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
<jsp:useBean id="user" class="edu.hzu.javaweb.labs.se1414080902124.Student" scope="request"/>
<body>
<c:out value="数据已成功保存到数据库,数据如下："> </c:out><br/>

<%
    Student student = (Student) request.getAttribute("stu");
    session.setAttribute("stu",student);
%>
姓名：<%= student.getName()%>
学号：<%= student.getId()%>
班级：<%= student.getClazz()%>
就职城市：<%= student.getCity()%>
就职薪资：<%= student.getSalary()%>

<form action="index.jsp" method="post">
    <input type="button" value="修改数据" onclick="javascript:history.back(-1)"/>
</form>

<form action="DeleteServlet" method="post">
    <input type="submit" value="删除数据" />
</form>
</body>
</html>
