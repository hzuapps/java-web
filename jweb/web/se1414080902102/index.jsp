<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE-edge">
    <title>bhjavsdf hjvashjd </title>
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
	<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
	<script type="text/javascript" src="index.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>
<c:out value="${1+2}"/>
<%Calendar rightNow=Calendar.getInstance(); 
Integer Hour=new Integer(rightNow.get(Calendar.HOUR_OF_DAY));
request.setAttribute("hour",Hour);%>

<c:if test="${hour>=0 && hour<=11 }">上午好！</c:if>
<c:if test="${hour>=12 && hour<=17 }">下午好！</c:if>
<c:if test="${hour>=18 && hour<=23 }">晚上好！</c:if>
<c:forEach var="i" begin="1" end="10" step="3">
${i}
</c:forEach>
<%=new Date().toLocaleString()%>
<form class="form-horizontal"  method="get">

<div class="form-group">
<label for="inputaccount" class="col-sm-2 control-label" style="font-size:20px">帐号:</label>
<div class="col-sm-10">
<input type="text" class="form-control" id="inputaccount" style="width:200px">
</div>
</div>

<div class="form-group">
<label for="inputPassword" class="col-sm-2 control-label" style="font-size:20px"> 密码:</label>
<div class="col-sm-10">
<input type="password" class="form-control" id="inputPassword" style="width:200px">
</div>
</div>

<div class="form-group">
<div class="col-sm-offset-2 col-sm-10">
<div class="checkbox">
<label>
<input type="checkbox" size="8">记住帐号
</label>
</div>
</div>
</div>

<div class="form-group">
<div class="col-sm-offset-2 col-sm-10">
<input type="button" class="btn btn-default" value="登录"/>
</div>
</div>
</form>
 </body>
</html>