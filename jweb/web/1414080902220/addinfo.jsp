<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <title>统计收入</title>
    <style type="text/css">
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
    	textarea{
    		background-color: #777;
			border:none;
			border-radius:10px;
    	}
    </style>
	

  </head>
  
  <body>
  	<br/><br/><br/><br/>
  	<div class="col-md-2"></div>
  	<div class="col-md-8" id="div1">
  		<form  action="1414080902220" method="post">
  				<label for="income"> 收入：</label>
	         	<input type="text" name="income" id="income"><br/><br/>
	         	<label for="time"> 时间：</label>	 
	        	<input type="text" name="time"><br/><br/>
	        	<label for="texts">来源：</label>
	        	<input type="text" name="description" id="texts"><br/><br/>
	        	<input type="submit" value="添加">
	    </form>
  	</div>
  	<div class="col-md-2"></div>
    
  </body>
</html>
