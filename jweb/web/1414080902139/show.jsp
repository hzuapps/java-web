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
    
    <title>我的简历</title>
    
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
	.home{
		padding-left: 15px;
	}
	.home:hover{
		text-decoration: none;
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
		padding-bottom:20px;
		margin-bottom: 15px;
		font-weight: bold;
		color: hsl(145,63%,49%);
		font-size: 30px;
		background-color: #f8f8f8;
	}
	label{
		font-family: "微软雅黑";
		font-size: 18px;
		text-align: right;
	}
	.show{
		font-size: 18px;
		height: auto;
	}
	.row{
		margin-bottom: 15px;
	}
	</style>
  </head>
  
  <body>
  <% 	request.setCharacterEncoding("UTF-8");%>
	<div class="container">
		<div class="nav">
			<a href="home.jsp" class="home">返回首页</a>
			<ul class="right">
				<li>
					<c:if test="${ _username == null }">
						<a href="login.jsp">你好，请登录</a>
					</c:if>
					<c:if test="${ _username != null }">
							<c:out value="${ _username }"></c:out>,欢迎你
  					</c:if>
				</li>
				<li><a href="#">注册</a></li>
			</ul>  			
		</div>
		<h1 class="text-center">我的简历</h1>
		<div class="row">
			<label class="col-sm-4">姓名</label>
			<%-- <%String nameshow=request.getParameter("name"); %> --%>
			<div class="col-sm-5 show"><c:out value="${_name } "></c:out></div>
		</div>
		<%-- <%=request.getAttribute("_name") %> --%>
		<div class="row">
			<label class="col-sm-4">性别</label>
			<div class="col-sm-5 show"><c:out value="${_sex } "></c:out></div>
		</div>
				<div class="row">
			<label class="col-sm-4">专业</label>
			<div class="col-sm-5 show"><c:out value="${_profession } "></c:out></div>
		</div>
				<div class="row">
			<label class="col-sm-4">学历</label>
			<div class="col-sm-5 show"><c:out value="${_education } "></c:out></div>
		</div>
		<div class="row">
			<label class="col-sm-4">电话</label>
			<div class="col-sm-5 show"><c:out value="${_tel } "></c:out></div>
		</div>
		<div class="row">
			<label class="col-sm-4">邮箱</label>
			<div class="col-sm-5 show"><c:out value="${_email } "></c:out></div>
		</div>
		<div class="row">
			<label class="col-sm-4">兴趣爱好</label>
			<div class="col-sm-5 show" ><c:out value="${_hobby } "></c:out></div>
		</div>
		<div class="row">
			<label class="col-sm-4">实践经历</label>
			<div class="col-sm-5 show"><c:out value="${_experience } "></c:out></div>
		</div>
		<div class="row">
			<label class="col-sm-4">个人技能</label>
			<div class="col-sm-5 show"><c:out value="${_skill } "></c:out></div>
		</div>
		<div class="row">
			<label class="col-sm-4">荣誉资质</label>
			<div class="col-sm-5 show"><c:out value="${_honor } "></c:out></div>
		</div>
	</div>	
	<!-- 引入jQuery和bootstrap -->
	<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
	<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
  </body>
</html>
