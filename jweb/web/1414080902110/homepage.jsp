<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML >
<html>
<head>
<title>音乐论坛-音乐爱好者的聚集地</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<link
	href="http://cdn.bootcss.com/bootstrap/2.3.2/css/bootstrap.min.css"
	rel="stylesheet" />
<script src="http://cdn.bootcss.com/bootstrap/2.3.2/js/bootstrap.min.js"></script>
<style type="text/css">
.header {
	width: 100%;
	background: #f5f2f2;
	height: 25px;
}

.header .targer {
	width: 300px;
	height: 250px;
	position:absolute;
	margin-left: 1000px;
}

.header a {
	text-decoration: none;
	color: #d9534f;
	font-size: 14px;
}

.header a:hover {
	background: #d9534f;
	color: white;
	border-radius: 2px;
}

.adv {
	margin: 0 auto;
}

.line {
	width: 100%;
	height: 1px;
	background: #f5f2f2;
}

.content {
	width: 80%;
	margin: 0 auto;
}

.content button {
	margin-top: 3px;
}

.content .list {
	width: 100%;
	height: auto;
	margin-top: 3px;
	border-radius: 3px;
	border: 1px solid #d9534f;
}

.content .list_one {
	width: 95%;
	height: 40px;
	line-height: 40px;
	margin-top: 3px;
	border-bottom: 1px dotted #d9534f;
	margin: 0 auto;
}

.content a {
	text-decoration: none;
	font-family: 微软雅黑;
	font-size: 16px;
	font-weight: bolder;
	color: #575656;
}

.content a:hover {
	text-decoration: underline;
}

.content .author {
	float: right;
}

.content .author .line {
	color: #d9534f;
}

.foot {
	width: 100%;
	height: 40px;
	background: #f5f2f2;
	text-align: center;
	line-height: 40px;
}
</style>
</head>

<body>
	<div class="header">
		<div class="targer">
			<c:if test="${loginUserAccount!=null}">
				<i class="icon-user"></i>
				<a>当前用户名：</a><c:out value="${sessionScope.loginUserAccount }"></c:out>|
			</c:if>
			<i class="icon-headphones"></i> <a href="./index.jsp">登录</a>| 
			<i class="icon-home"></i> <a href="#">注册</a>
		</div>
	</div>
	<div class="adv">
		<img src="./images/adv.jpg">
	</div>
	<div class="line"></div>
	<div class="content">
		<button class="btn btn-danger">发布文章</button>
		<div class="list">
			<c:forEach var="essay" items="${messay}">
				<div class="list_one">
					<i class="icon-tag"></i><a href="#">${essay.essay_title}</a>
					<div class="author">
						<span>类别：${essay.classify}</span><span class="line">|</span><span>作者：${essay.user_name}</span><span
							class="line">|</span><span>阅读量：${essay.click}</span>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<div class="foot">&copy;2016&nbsp;hong版权所有</div>
</body>
</html>
