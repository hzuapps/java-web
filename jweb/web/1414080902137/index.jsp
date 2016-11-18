<!DOCTYPE html>
<%@page language="java" contentType="text/html" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
	<meta charset="utf-8">
	<!-- 网页随屏幕的大小变化而变化 -->
	<meta name="viewport" content="width=device-width,initial-scale=1.0">
	<!-- 支持IE浏览器 -->
	<meta http-equiv="X-UA-Compatible" content="IE-edge">
	<title>酒店管理系统</title>
	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
	<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
	<script type="text/javascript" src="index.js"></script>
	
<body >
	<div style="background-color:silver;height:150px">
	<div class="container">
		<div class="row" style="margin-top: 180px">
			<div class="col-md-5 col-md-offset-3" style="background-color: LightSteelBlue">
				<h1>欢迎登录XX酒店管理系统！</h1>
				<form action="se1414080902137" class="form-horizontal" style="margin-top: 20px" method="post">
				  <div class="form-group">
				    <label for="inputEmail3" class="col-sm-2 control-label">账号:</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="inputEmail3" name="username" placeholder="账号">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="inputPassword3" class="col-sm-2 control-label">密码:</label>
				    <div class="col-sm-10">
				      <input type="password" class="form-control" id="inputPassword3" name="password" placeholder="密码">
				    </div>
				  </div>
				  <div class="form-group">
				    <div class="col-sm-offset-2 col-sm-10">
				      <div class="checkbox">
				        <label>
				          <input type="checkbox"> 记住账号
				        </label>
				      </div>
				    </div>
				  </div>
				  <div class="form-group">
				    <div class="col-sm-offset-2 col-sm-10">
				      <!-- submit 提交form表单中的数据到action指定的页面
				      <button type="submit" class="btn btn-default">登录</button> -->
				      	<input type="submit" class="btn btn-default" value="登录"/>
				      	<input type="reset" class="btn btn-default" value="取消"/>
				    </div>
				    </div>
				  
				</form>
				</div>
			</div>
		</div>
		</div>


</body>
</html>