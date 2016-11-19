<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">
	<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
	<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>注册</title>
</head>
<body>	
	<div><a href="" id="back">返回</a></div>
	<div>
		<div style="margin:10% 20% auto 20%; background-color:#ffffa2; ">
			<div style="margin:5px auto auto 10%; background-color:;">
				<form id="registerform">
					<font>&nbsp;&nbsp;帐    号：</font>
					<input type="text" name="username" id="username" placeholder="请输入帐号" />
					&nbsp;&nbsp;<font id="notnull1" hidden="hidden">*not null</font>
					<font id="notnull11" hidden="hidden">*用户名已存在！</font>
					<br/><br/>
					
					<font>&nbsp;&nbsp;密      码：</font>
					<input type="text" name="password" id="password" placeholder="请输入密码" />
					&nbsp;&nbsp;<font id="notnull2" hidden="hidden">*not null</font><br/><br/>
					
					<font>验证码：</font>
					<input type="text" name="checkbox" id="checkbox" placeholder="请输入验证码" style="width:90px"/>
					&nbsp;&nbsp;<font id="notnull3" hidden="hidden">*not null</font><br/><br/>
					<input type="button" name="sub" id="sub" value="注册"/>&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="reset"/>
				</form>
			</div>
		</div>
	</div>
	
</body>
<script type="text/javascript">
 $(function(){
//不为空
	$("#username").blur(function(){
		if($("#username").val()==""){
			$("#notnull1").show();
			$("#notnull11").hide();
		}
		else{
			$.check();
			$("#notnull1").hide();
		}
	});
	
	$("#password").blur(function(){
		if($("#password").val()==""){
			$("#notnull2").show();
		}
		else{
			$("#notnull2").hide();
		}
	});

	$("#checkbox").blur(function(){
		if($("#checkbox").val()==""){
			$("#notnull3").show();
		}
		else{
			$("#notnull3").hide();
		}
	});
	
}); 

$(function(){
	 $("#sub").click(function(){
		if($("#username").val()==""){
			$("#notnull1").show();
		}		
		else if($("#password").val()==""){
			$("#notnull2").show();
		}
		else if($("#checkbox").val()==""){
			$("#notnull3").show();
			return;
		}
		else{
			$.gotoAjax();
		}
	}); 
});
$.gotoAjax=function(){
	$.ajax({
		type:"post",
		data:$("#registerform").serialize(),
		datatype:"text",
		url:"RegisterServlet",
		success:function(data){
			if(data==0)
				alert("注册失败");
			else if(data==1)
				alert("注册成功");
		}
	});
}

$.check=function(){
	$.ajax({
		type:"post",
		data:{
			username:$("#username").val(),
		},
		datatype:"text",
		url:"RegisterServlet",
		success:function(data){
			if(data==1)
			{	
				$("#notnull11").show();
			}
			else{
				$("#notnull11").hide();				
			}
		}
	});
}
</script>


<script type="text/javascript">
	$("#back").click(function(){
		window.history.go(-1);
	});
</script>
</html>