<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>登录扣扣简历管理系统</title>
    <meta http-equiv="Expires" content="0">
    <meta http-equiv="kiben" content="no-cache">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="ajax.js"></script>
	<style type="text/css">
	body{
		margin: 0;
		padding: 0;
		font-weight: normal;
		font-family: "微软雅黑";
		background-color: hsl(0, 0%, 96%);
	}
	.login_box h1 a, .login_box .h2_title a {
		color: hsl(186, 70%, 49%);
		font-size: 18px;
	}
	a:link{
		text-decoration: none;
	}
	span{
		margin: 0;
		padding: 0;
	}
	.login_page{
		padding: 80px 0;
		background-color: hsl(0,0%,96%);
	}
	h1{
		margin: 0;
		display: block;
		padding: 20px;
		color: hsl(145,63%,49%);/*HSL色*/
		height: 60px;
		line-height: 45px;
		font-size: 45px;
		text-align: center;
		font-weight: bold;
	}
	.login_page .login_box{
		left: 0;
		top: 0;
		padding: 30px 50px 40px;
		width: 280px;
		z-index: 1200;
		background: hsl(0, 100%, 100%);
		box-shadow: 2px 2px 5px hsl(0, 0%, 87%);
		box-sizing: content-box;
	}
	.login_page .alone{
		position: static;
		margin: 0 auto;
	}
	.login_box .h2_title{
		color: hsl(0,0%,27%);
		font-size: 22px;
		margin-bottom: 30px;
	}
	.fr{
		float: right;
		display: inline;
	}
	.login_box .for_passwordbtn {
		color: hsl(353, 75%, 63%);
	}
	form{
		margin: 0;
		padding: 0;
		display: block;
	}
	.login_box .form_group {
		position: relative;
		color: hsl(0, 0%, 60%);
		margin-bottom: 15px;
	}
	.login_box .form_group .form_control {
		width: 250px;
		height: 45px;
		border-radius: 5px;
		padding: 0 15px;
		border: 1px hsl(0, 0%, 80%) solid;
		box-sizing: content-box;
	}
	input{
		outline: none;
		font-size: 15px;
	}
	div {
		display: block;
	}
	span {
		margin: 0;
		padding: 0;
	}
	.login_box .form_group .control_label {
		display: none;
	}
	.login_box .login_btn {
		border: 0;
		width: 100%;
		height: 45px;
		margin-top: 10px;
		margin-bottom: 10px;
		font-size: 16px;
		background-color: hsl(186, 70%, 49%);
		text-align: center;
		border-radius: 5px;
		color: hsl(0, 100%, 100%);
		cursor: pointer;
		font-family: "微软雅黑";
	}
	.login_box .login_btn:hover{
		background-color: hsl(196, 70%, 49%);
	}
	.social-login {
		position: relative;
		margin-left: 0;
		text-align: center;
		z-index: 1;
	}
	</style>
</head>
<body>
	<div class="login_page">
		<h1 style="">简历管理系统</h1>
		<div class="login_box alone">
			<h2 class="h2_title">登录系统
				<a target="_blank" class="fr" href="#">注册</a>
			</h2>
			<form id="target" method="post" name="login" action="loginServlet">			
				<!-- 账号 -->
				<div class="form_group">
					<label class="control_label">账号</label>
					<div class="">
						<input class="form_control" type="text" name="username" id="username" placeholder="邮箱/用户名" >
					</div>
				</div>
				<!-- 密码 -->
				<div class="form_group">
					<label class="control_label">密码</label>
					<div>
						<input class="form_control" type="password" name="password" id="password" placeholder="密码">
					</div>
				</div>

				<div class="form_group">
					<div>
						<span>
							<label>
								<input type="checkbox" checked="checked" name="">记住密码
							</label>
							<a class="fr for_passwordbtn" href="#">忘记密码</a>
						</span>
					</div>
					<input type="submit" class="login_btn" id="" name="" onclick="" value="登录">
				</div>
			</form>
		</div>
	</div>
</body>
</html>
