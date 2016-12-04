<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <title>欢迎登录</title>
    <style>
    	body{
    		background:#666;
    	}
    	input{
    		background-color: #777;
			border:none;
			border-radius:10px;
			text-align:center;
    	}
    	#div1{
    		padding: 10% 10% 10% 10%;
    	}
    </style>
  </head>
  
  <body>
  		<br/><br/><br/><br/>
	  	<div class="col-md-2"></div>
	  	<div class="col-md-8" id="div1">
	  		<form  action="1414080902220/addinfo.jsp" method="post">
	  				<label for="account"> 帐号</label>
		         	<input type="text" name="account" id="account"><br/><br/>
		         	<label for="pwd"> 密码</label>	 
		        	<input type="password" name="pwd" id="pwd"><br/><br/>
		        	<input type="submit" value="登录">
		    </form>
	  	</div>
	  	<div class="col-md-2"></div>
  </body>
</html>
