<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%System.out.println("Hello Jsp"); %>
<html>
<head>
	<title>高级网页设计</title>
	<style type="text/css">
	.button_design
	{
		width: 100px;
		height: 50px;
		margin:0 auto;
		margin: 10px;
		position: relative;
		left: 50px;
	}
	.button_div
	{
		width: 200px;
		height: 100px;
		margin: 0 auto;
		margin-top: 100px;
	}
	.border_design
	{
		border: 3px solid gray;
		width: 500px;
		height: 400px;
		margin: 0 auto;
	}
	</style>
</head>
<body>
	<div>
		<fieldset class="border_design">
			<legend align="center">手机销售系统</legend>
			<div class="button_div">
				<div>
					<input type="button" value="创建手机订单" class="button_design">
				</div>
				<div>
					<input type="button" value="录入售后信息" class="button_design">
				</div>
			</div>			
		</fieldset>
	</div>
</body>
</html>
