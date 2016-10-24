<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML >
<html>
<head>
<title>音乐论坛登录页面</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<link href="http://cdn.bootcss.com/bootstrap/2.3.2/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
body {
	background: #f5f2f2;
	width: 100%;
	height: 100%;
}

.container {
	border: 2px solid #f5f2f2;
	border-radius: 8px;
	margin-top: 5%;
	width: 360px;
	height: 280px;
	background: #ffffff;
}

.title {
	font-size: 20px;
	font-weight: bolder;
	font-style: 微软雅黑;
	text-align: center;
	height: 40px;
	line-height: 40px;
}

.time {
	font-size: 14px;
	text-align: center;
}

.account {
	margin-top: 10px;
	width: 70%;
	margin-left: 15%;
}

.password {
	margin-top: 10px;
	width: 70%;
	margin-left: 15%;
}

.submit {
	margin-bottom: 10px;
	width: 70%;
	margin-left: 15%;
}

.checkbox {
	margin-left: 15%;
}
</style>
<!-- <script type="text/javascript" src="./js/index.js"></script> -->
</head>

<body>
	<div class="container">
		<form id="from1" action="1414080902110" method="post">
			<div class="title">音乐论坛登陆</div>
			<div class="time">
				(当前时间：<%=new Date().toLocaleString() %>)
			</div>
			<hr>
			<div class="account">
				<span class="add-on"><i class="icon-user"></i></span> <input
					id="account" type="text" name="account" placeholder="请输入你的账号">
			</div>
			<div class="password">
				<span class="add-on"><i class="icon-pencil"></i></span> <input
					id="password" type="password" name="password" placeholder="请输入你的密码">
			</div>
			<label class="checkbox"><input type="checkbox" name=""><small>记住密码</small></label>
			<div class="submit">
				<button class="btn btn-primary btn-block" style="width: 240px;"
					type="submit">登录</button>
			</div>
		</form>
	</div>
	<script src="http://cdn.bootcss.com/bootstrap/2.3.2/js/bootstrap.min.js"></script>
</body>
</html>
