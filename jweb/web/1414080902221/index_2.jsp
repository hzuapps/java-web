<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <head>
    <base href="<%=basePath%>">
    
    <title>提交</title>
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
  <%= new java.util.Date() %>
    <form id="add" action="/JSPdamo/Servlet1414080902221" method="post">
  <div class="form-group">
    <label for="goodsname">添加商品</label>
    <input type="text" class="form-control" name="goodsname" placeholder="goodsname">
  </div>
  
  <div class="form-group">
    <label for="number">添加数量</label>
    <input type="text" class="form-control" name="number" placeholder="number">
  </div>
  
 <button type="submit" class="btn btn-default">添加</button>
 <br>
 <c:if test="${!empty sessionScope.message}">
   <c:out value="${sessionScope.message}"></c:out>&nbsp;&nbsp;
   </c:if>
 <br>
</form>
  </body>
</html>