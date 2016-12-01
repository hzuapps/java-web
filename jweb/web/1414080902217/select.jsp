<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- 新 Bootstrap 核心 CSS 文件 -->
	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
	
	<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
	<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
	
	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	<title>事务选择界面</title>
</head>

<body>
<br>
<div class="row">
   	<div class="col-xs-offset-1 col-xs-8"><font size="3"face="微软雅黑">现在时间是: <%= (new java.util.Date()).toLocaleString()%></font></div>
   	<c:if test="${customerName != null}">
   	<div class="col-xs-2"><font size="3"face="微软雅黑"><%=request.getSession().getAttribute("customerName") + "，欢迎你"%></font></div>
   	</c:if>
   	<c:if test="${customerName == null}">
   	<div class="col-xs-2"><font size="3"face="微软雅黑">游客，欢迎你！</font></div>
   	</c:if>
</div>
<div class="row">
	<div class="col-xs-offset-9 col-xs-1"><a class="btn btn-default btn-sm" href="clear" role="button">退出登陆</a></div>
</div>
<hr width="95%"size="20"color="#00ffee"align="center"/>
<div class="text-center">
           <font size="6"face="微软雅黑">业务选择</font>
</div>
<br>
<form action="/zhhao/Orders/makeOrder.jsp">
	<div class="text-center">
           <input class="btn btn-default btn-lg"type="submit" value="提交订单" name="button1"><br>
           <label class="col-xs-12 control-label">(添加新的订单信息)</label>
	</div>
</form>
<br>
<form action="/zhhao/Orders/lookOrder.jsp">
	<div class="text-center">
           <input class="btn btn-default btn-lg"type="submit" value="查看订单" name="button2">
           <label class="col-xs-12 control-label">(查看已有订单信息)</label>
	</div>
</form>
</body>

</html>
