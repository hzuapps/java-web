<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'InfoCheck.jsp' starting page</title>
    
    <!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">

<!-- 可选的Bootstrap主题文件（一般不用引入） -->
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    
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
   <% Calendar rightNow = Calendar.getInstance();
      Integer Hour = new Integer(rightNow.get(Calendar.HOUR_OF_DAY));
      request.setAttribute("hour",Hour);
   %>
        尊敬的用户，
   <c:if test="${hour>=0&&hour<=11 }">早上好！</c:if>
   <c:if test="${hour>=12&&hour<=17 }">下午好！</c:if>
   <c:if test="${hour>=18&&hour<=23 }">晚上好！</c:if>
   <hr border="2">
   <table border="1" align="center" width="20%">
    <tr><td colspan="2">基本参数</td></tr>
    <c:forEach var="car" items="${carMsg}" varStatus="status"  >
    <tr>
    <td align="right">
    <c:out value="${carname[status.count-1] }"/></td>
    <td align="center">
    <c:out value="${car}" /></td>
    </tr>
    </c:forEach>
    <tr ><td align="center"><input type="submit" value="提交"></td>
    <td align="center"><input type="submit" value="修改"></td></tr>
   </table>
  
  </body>
</html>
