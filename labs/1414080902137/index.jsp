<!DOCTYPE html>
<%@page contentType="text/html" import=pageEncoding="UTF-8"%>
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
				<form class="form-horizontal" style="margin-top: 20px" method="get">
				  <div class="form-group">
				    <label for="inputEmail3" class="col-sm-2 control-label">账号:</label>
				    <div class="col-sm-10">
				      <input type="email" class="form-control" id="inputEmail3" placeholder="账号">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="inputPassword3" class="col-sm-2 control-label">密码:</label>
				    <div class="col-sm-10">
				      <input type="password" class="form-control" id="inputPassword3" placeholder="密码">
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
				      	<input type="button" class="btn btn-default" value="登录"/>
				    </div>
				    </div>
				  
				</form>
				</div>
			</div>
		</div>
		</div>
		<%  for(int i=0;i<4;i++){
	out.print(i+"   ");
} %>

</body>
</html>