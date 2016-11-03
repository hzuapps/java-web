<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<p>
   	今天的日期是: <%= (new java.util.Date()).toLocaleString()%>
</p>
<hr width="95%"size="15"color="#00ffee"align="center"/>
<div class="text-center">
           <p><h2>业务选择</h2></p>
</div>
<br>
<form action="提交订单.jsp">
	<div class="text-center">
           <input type="submit" value="提交订单" name="button1"><br>
           <h5>(添加新的订单信息)</h5>
	</div>
</form>
<br>
<form action="查看订单.jsp">
	<div class="text-center">
           <input type="submit" value="查看订单" name="button2">
           <h5>(查看已有订单信息)</h5>
	</div>
</form>
</body>

</html>
