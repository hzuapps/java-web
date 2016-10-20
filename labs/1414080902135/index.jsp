<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="utf-8"%>
    
<%
	response.setCharacterEncoding("utf-8");
	System.out.println("断点调试成功！");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 网页随屏幕的大小变化而变化 -->
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<!-- 支持IE浏览器 -->
<meta http-equiv="X-UA-Compatible" content="IE-edge">

<title>欢迎来到百货乐购</title>

<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
<script language="JavaScript">
$(function(){
	var id;
	var password;
	$("input[type=button]").click(function(){
		id=$("#inputEmail3").val();
		password=$("#inputPassword3").val();
		if(id==""||password==""){
			alert("请输入你的账号和密码！");
		}else{
			$.getJSON("success.json",function(date){
				alert(date.mag);
			})
		}
	});
})
</script>
</head>
<body background="frist.jpg">
	<div class="container">
		<div class="row" style="margin-top: 240px">
			<div class="col-md-6 col-md-offset-6" style="background-color: white">
				<h1>登   录！</h1>
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
				  </div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
