<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html>
<html lang="zh-CN">
<head>
<link rel="stylesheet" type="text/css" href="mpq.css"/>
<title>登录</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>
<center>
<h1><%=new java.util.Date()%></h1>
</center>
	<div id="main_special">
		<fieldset><legend>登录</legend>
			<form action="" method="post">
				<label for="label1">用&nbsp; 户&nbsp; 名：</label>
				<input type="text" name="name" id="username label1"/><font style="font-size:12px;color:#898983"> *用户名不得超过16位字符</font><br>
				<label for="label2">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</label>
				<input type="password" name="pw" id="password label2"/><font style="font-size:12px;color:#898983"> *密码不能超过16位字符</font><br>
				<input type="submit" name="submit" class="submit" value="登录"/>
				<input type="reset" name="reset" class="submit" value="重置"/>
			</form>
		</fieldset>
	</div>
	<script type="text/javascript">
      $( ".submit" ).click(function(event) {
		    alert("登录成功");
	        $.ajax({ 
	          url: "success.json"
	        }).done(function(data){
		        	if (console&&console.log){
						var account = $('#username').value;
						var password = $('#password').value;
						console.dir(data);
						alert(data.msg);	
		        	}
	        })
      });
    </script>
</body>
</html>