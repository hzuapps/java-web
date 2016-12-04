<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="css/shop_manager.css">
	<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
	<title>商品管理</title>
</head>
<body>
	<!-- 菜单栏 -->
	 <nav class="navbar navbar-static-top">
	 	<div class="navbar-header">
	 		<a class="navbar-brand" href="#">商品管理</a>
	 	</div>
    </nav>
    <!-- 主要内容 -->
    <div class="container-fluid">
    	<div class="row">
    		<div class="col-xs-1">
    			<div class="btn-group-vertical" role="group">
    				<a class="btn btn-default btn-lg" href="Shop_mess" target="frame">商品信息</a>
				</div>
    		</div>
    		<div class="col-xs-11">
    			<iframe name="frame" width="100%" height="750px" frameborder="0" ></iframe>
    		</div>
    	</div>
    </div>
</body>
</html>