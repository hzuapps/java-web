<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">

    <title>SelectMessage</title>
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css"/>
    <script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
  </head>
  <c:if test="${swindy=='1234'}">
  <p>Hello,swindy!</p>
  </c:if>
  <c:if test="${swindy==null}">
  <% response.sendRedirect("login.jsp");%>
  </c:if>
  <body>
    <div>
    <table class="table table-striped">
  <caption>论文题目</caption>
  <thead>
    <tr>
      <th>题目名称</th>
      <th>题目年份</th>
      <th>题目来源</th>
      <th>所属教研室</th>
      <th>指导教师</th>
      <th>限选人数</th>
    </tr>
  </thead>
  <tbody>
   <c:forEach var="message" items="${List}">
    <tr>
      <td><c:out value="${message.titleName}" default="未知"></c:out></td>
      <td><c:out value="${message.age}" default="未知"></c:out></td>
      <td><c:out value="${message.source}" default="未知"></c:out></td>
      <td><c:out value="${message.teachAndResearch}" default="未知"></c:out></td>
      <td><c:out value="${message.teacher}" default="未知"></c:out></td>
      <td><c:out value="${message.num}" default="未知"></c:out></td>


    </tr>
    </c:forEach>
  </tbody>
</table>
    </div>
  </body>
</html>
