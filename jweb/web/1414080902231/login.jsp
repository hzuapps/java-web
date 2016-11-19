<%@ page language="java" contentType="text/html"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">
	<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
	<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	<title>Login</title>
</head>
<body>

	<div>
	<div style="margin-bottom:70px;margin-top:20px;background-color:;">	
	<font style="margin-left:15%;"><a href="" id="back">返回主界面</a></font>
	<font style="margin-left:50%;">没有帐号？<a href="register.jsp" >立即注册！</a></font>
	</div>
	</div>
	
	<div style="margin:20px auto; width:900px; height:500px;background-size:900px 500px; background-image:url(logindesk.jpg)" >
		<div style="margin:20px auto; background-color:#fffffa; width:320px; margin-top:20px;">
		<div style="margin:10px 200px 10px 30px"><h4><b>帐号登录</b></h4></div>
			<div style="margin:10px 20px; background-color:#fffffa; ">
			
			<form id="loginform" >
				<input type="text" id="username" name="username" placeholder="帐号" /><br/><br/>
				<input type="password" id="password" name="password" placeholder="密码" /><br/><br/>
				<input type="text" id="checkcode" name="checkcode" placeholder="验证码"/>
				<img border="0" src="checkcode"/>
				<input type="button" value="换一张" />
				<br/>
				<div style="margin:10px 120px 10px 20px">
				<input type="button" id="sub" value="登录"/>&nbsp;&nbsp;
				<input type="reset" value="重置"/>
				</div>
			</form>
			
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
	$("#sub").click(function(){
		$.ajax({
			type:"post",
			data:{
				username:$("#username").val(),
				password:$("#password").val()
			},
			datatype:"text",
			url:"LoginServlet",
			success:function(data){
				if(data==1){	
					alert("登陆成功");
					window.location.href="index.jsp";
				}
				if(data==0){	
					alert("登陆失败，请重新登陆");
					window.location.reload();
				}
			}
		});
		
	});
</script>

<script type="text/javascript">
//返回
$(function(){
	$("#back").click(function(){
		window.history.go(-1);
	});
});	

</script>

</html>