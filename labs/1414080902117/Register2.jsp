<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>新用户注册界面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">

<!-- 可选的Bootstrap主题文件（一般不用引入） -->
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery-1.11.3.js"></script>
<link rel="stylesheet" href="css/register2.css">

<script src="js/Register2.js"></script>
  </head>
  
  <body>
  	<form action=""  method="post" id="form_rg">
  	<table align="center">
  		<tr>
  			<td colspan = "2" width="600">
  				<h2>新用户注册界面</h2>
  				<hr>
  			</td>
  		</tr>
  		<tr>
  			<td>
    			<div class="input-group">
  					<span class="input-group-addon">用户账号:</span>
  					<input type="text" class="form-control" placeholder="Username" id="account" onblur="f_acccheck()"/>
				</div>
			</td>
			<td>
				<div id="acc_rs"></div>
			</td>
		</tr>
		<tr>
			<td>
				<br/>
			</td>
		</tr>
		<tr>
			<td>
				<div class="input-group">
  					<span class="input-group-addon">用户密码:</span>
  					<input type="password" class="form-control" placeholder="Password" id="password" onblur="f_pwdcheck()"/>
				</div> 	
			</td>
			<td>
				<div id="pwd_rs"></div>
			</td>
		</tr>
		<tr>
			<td>
				<br/>
			</td>
		</tr>
		<tr>
			<td>
				<div class="input-group">
  					<span class="input-group-addon">密码确认:</span>
  					<input type="password" class="form-control" placeholder="Password" id="passwordr" onblur="f_pwdrcheck()"/>
				</div>
			</td>
			<td>
				<div id="pwd2_rs"></div>
			</td>
		</tr>
		<tr>
			<td>
				<br/>
			</td>
		</tr>
		<tr>
			<td>
				<div class="input-group">
  					<span class="input-group-addon">用户昵称:</span>
  					<input type="text" class="form-control" placeholder="Name" id="name" onblur="f_namecheck()"/>
				</div>
			</td>
			<td>
				<div id="name_rs"></div>
			</td>
		</tr>
		<tr>
			<td>
				<br/>
			</td>
		</tr>
		<tr>
			<td colspan ="2" align="center">
				<div class="list-group">
  					<a href="#" class="list-group-item active" id="register" onclick="f_register()">
    				注册
  					</a>
			</td>	
		</tr>
	</table>
    
    
  	</form>
  </body>
</html>
