<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE-edge">
    <title>登录系统</title>
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
	<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
	<script type="text/javascript" src="index.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
body,td,th {
	color: #FF0000;
}
</style>
</head>
    <body background="../../../img/4.jpg" >
<form class="form-horizontal"  method="get" >

<div class="form-group">
<label for="inputaccount" class="col-sm-2 control-label" style="font-size:20px">帐号:</label>
<div class="col-sm-10">
<input type="text" class="form-control" id="inputaccount" style="width:200px" placeholder="账号">
</div>
</div>

<div class="form-group">
<label for="inputPassword" class="col-sm-2 control-label" style="font-size:20px"> 密码:</label>
<div class="col-sm-10">
<input type="password" class="form-control" id="inputPassword" style="width:200px" placeholder="123456">
</div>
</div>

<div class="form-group">
<div class="col-sm-offset-2 col-sm-10">
<div class="checkbox">
<label>
<input type="checkbox" size="8">记住帐号
</label>
</div>
</div>
</div>

<div class="form-group">
<div class="col-sm-offset-2 col-sm-10">
<input type="button" class="btn btn-default" value="登录"/>
</div>
</div>
</form>
 </body>
</html>