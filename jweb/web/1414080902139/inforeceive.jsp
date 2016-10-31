<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<base href="<%=basePath%>">
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Add Your Resume</title>
	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      	<script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      	<script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
	<title>Document</title>
</head>
<body>
	<% 	request.setCharacterEncoding("UTF-8");%>
<div class="container">
<form id="" class="form-horizontal" role="form" style="background-color: #f5f5f5">
	<div class="text-center" style="fone-family:微软雅黑;font-size:24px;height:45px;line-height:45px">Save Successful !</div>
	<div class="form-group">
  		<span for="" class="col-sm-2 col-sm-offset-4">Full Name</span>
      	<span class=""><%=request.getAttribute("outputful") %></span>
  	</div>
  	<div class="form-group">
  		<span for="" class="col-sm-2 col-sm-offset-4">Sex</span>
      	<span class=""><%=request.getAttribute("outputsex") %></span>
  	</div>
  	<div class="form-group">
  		<span for="" class="col-sm-2 col-sm-offset-4">Grade</span>
      	<span class=""><%=request.getAttribute("outputgrade") %></span>
  	</div>
  	<div class="form-group">
  		<span for="" class="col-sm-2 col-sm-offset-4">Profession</span>
      	<span class=""><%=request.getAttribute("outputpro") %></span>
  	</div>
  	<div class="form-group">
  		<span for="" class="col-sm-2 col-sm-offset-4">Tel</span>
      	<span class=""><%=request.getAttribute("outputtel") %></span>
  	</div>
  	<div class="form-group">
  		<span for="" class="col-sm-2 col-sm-offset-4">Email</span>
      	<span class=""><%=request.getAttribute("outputemail") %></span>
  	</div>
  	<div class="form-group">
  		<span for="" class="col-sm-2 col-sm-offset-4">Hobby</span>
      	<span class=""><%=request.getAttribute("outputhobby") %></span>
  	</div>
  	<div class="form-group">
  		<span for="" class="col-sm-2 col-sm-offset-4">Speciality</span>
      	<span class=""><%=request.getAttribute("outputspe") %></span>
  	</div>
  	<div class="">
  		<span for="" class="col-sm-2 col-sm-offset-4">Experience</span>
      	<span class=""><%=request.getAttribute("outputexp") %></span>
  	</div>
</form>

<footer>
  <div class="text-center" style="background-color: #ddd;">
      <a href="#">Jiushig</a>&nbsp;&copy;&nbsp;<span><%=new Date()%></span>
  </div>
</footer>
</div>
<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
</body>
</html>
