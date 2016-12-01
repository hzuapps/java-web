<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
		<meta charset="utf-8">
		<title>聚会添加系统</title>
		<style>
			.all{
				width:300px;
				height:400px;
				border-style: solid;
				border-color: black;
				background-color: #C0B7BF;
				position: absolute;
				left:50%;
				top:50%;
				margin-left:-150px;
				margin-top:-200px;
			}
			a{
				text-decoration: none;
			}
			.text{
				color:black;
				font-weight: 700;
			}
		</style>
	</head>
	<body>
<%
request.setAttribute("plan","12.01罗浮山班游");
%>
		<div class="all">
			<h2 align="center">聚会添加系统</h2>
			<img src="juhui.jpg" alt="" width="100%"><br/><br/>
			<div class="row">
			<div class="col-xs-6 text"><button class="btn-info"><a href="1414080902216">添加聚会记录</a></button></div>
			<div class="col-xs-6 text"><button class="btn-info"><a href="">查看聚会记录</a></button></div>
			<ul>
			<c:if test="${!empty plan}">
				<li><c:out value="${plan}"/></li>
			</c:if>
			</ul>
			</div>
		</div>
	</body>
</html>