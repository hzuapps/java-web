<%@ page contentType="text/html" pageEncoding="utf-8" %>
<html>
	<head>
		<title>登录页面</title>
	<!-- 新 Bootstrap 核心 CSS 文件 -->
	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
	
	<!-- 可选的Bootstrap主题文件（一般不用引入） -->
	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">
	
	<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
	<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
	
	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	</head>
	<body>
		<form class="form-horizontal" action="login" method="post">
			<div class="form-group">
				<label class="col-sm-2 control-label" >请输入用户名：</label>
				<div class="col-sm-10">
					<input class="form-control" type="text" name = "usename">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label" >请输入密码：</label>
				<div class="col-sm-10">
					<input class="form-control" type="password" name = "userpwd">
				</div>
				<p align="center" >	
				<input type="submit" value="登录" class="btn btn-default" >
				<input type="reset" value="取消" class="btn btn-default" >
				
				</p>
			</div>
		</form>
	</body>
</html>