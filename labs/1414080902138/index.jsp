<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
<!-- 可选的Bootstrap主题文件（一般不用引入） -->
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="index.js"></script>
<style type="text/css">
body{color:#FF7B0B;font-size:18px;}
.title{text-align: center;font-size:50px;}
.login{text-align: center;}
#InputName,#InputPassword{width:250px; margin:0 auto;}
.checkbox{margin-left: -130px;}
.btn{width: 253px;}
</style>
<script type="text/javascript">
 function H(){
 		var name=document.forms[0].Username.value;
 		var pwd=document.forms[0].UserPwd.value;
 		if(name.length<=0) window.alert("The User name can not be empty.");
 		else if(pwd.length<=0) window.alert("The Password can not be empty.");
 		else if(name!="HCJ"&pwd!="123") window.alert("You do not have permission to log in.");
        else
 		{window.alert("Welcome Back,Admin");		 
 		window.alert("Today is <%=new Date()%>"); 	
 		document.forms[0].submit();}
 		} 
 </script>
  <head>       
    <title>Login Page</title>    
  </head> 
  <body>
    <h1 class="title"><br/>Login</h1><br/>
<div class="container" >
<form role="form" class="login">
  <div class="form-group">
    <label for="InputName">Name</label>
    <input type="name" class="form-control" id="InputName"  name="Username" placeholder="please enter your name">
  </div>
  <div class="form-group">
    <label for="InputPassword">Password</label>
    <input type="password" class="form-control" id="InputPassword" name="UserPwd" placeholder="please enter your password">
  </div>
  <input type="Button" class="btn btn-primary" value="Submit" onClick="H()"/>
</form>
  </body>
</html>
