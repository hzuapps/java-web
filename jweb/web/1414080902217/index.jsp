<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <title>登录界面</title>
</head>

<body>
<p></p>
<p></p>
<div class="text-center"><font size="5"face="微软雅黑">填写登录信息</font></div>
<p></p>
<p></p>
<form action="1414080902217"method="post"class="form-horizontal" >
	<div class="form-group">
    <label for="inputEmail3" class="col-xs-4 control-label">用户名:</label>
    <div class="col-xs-4">
      	<input type="text" class="form-control" name="username" placeholder="用户名">
    </div>
  	</div>
	
	<div class="form-group">
    <label for="inputEmail3" class="col-xs-4 control-label">密码:</label>
    <div class="col-xs-4">
      	<input type="password" class="form-control" name="userpwd" placeholder="密码">
    </div>
  	</div>
  	
	<div class="form-group">
    <div class="row">
      <div class="col-xs-offset-5 col-xs-1"><button type="submit" class="btn btn-default">登录</button></div>
      <div class="col-xs-5"><button type="reset" class="btn btn-default">取消</button></div>
    </div>
  	</div>
</form>       
</body>
</html>