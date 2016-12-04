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
    
    <title>简历管理系统首页</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
	<style type="text/css">
	body{
		font-family: "微软雅黑";
	}
	.nav{
		background-color: #f8f8f8;
	}
	.tab-content{
		margin-top: 15px;
	}
	ul{
		background-color: #f8f8f8;
		display: block;
		margin: 0;
		padding: 0;
	}
	.right li{
		list-style:none;
		display: inline;
		padding-right: 15px;
	}
	ul li a:hover{
		text-decoration: none;
	}
	.right{
		float: right;
	}
	h1{
		margin: 0;
		padding-bottom: 10px;
		font-weight: bold;
		color: hsl(145,63%,49%);
		font-size: 45px;
		background-color: #f8f8f8;
	}
	.navbar{
		border: 0;
	}
	.navbar-nav{
		margin: 0;
	}
	.navbar-nav li:hover{
		background-color: #eee;
		border-radius: 4px;
	}
	</style>
  </head>
  
  <body>
	<div class="container">
		<div class="nav">
			<ul class="right">
				<li>
					<c:if test="${ _username == null || _username ==''}">
						<a href="login.jsp">你好，请登录</a>
					</c:if>
					<c:if test="${ _username != null && _username !=''}">
							欢迎你，<c:out value="${ _username }"></c:out>
  					</c:if>
				</li>
				<li><a href="#">注册</a></li>
				<c:if test="${ _username != null && _username !=''}">
				<li>
					<a href="login.jsp">退出</a>
				</li>
  				</c:if>
			</ul>  			
		</div>
		<h1 class="text-center">简历管理系统</h1>
		<div class="navbar navbar-default">
		  	<ul class="nav navbar-nav">
		  		<li><a href="add.jsp">录入简历</a></li>
		  		<li><a href="modify.jsp">修改简历</a></li>
		  		<li><a href="find.jsp">查询简历</a></li>
		  	</ul>	
		</div>	
	</div>	
	<!-- 引入jQuery和bootstrap -->
	<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
	<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
  </body>
</html>
