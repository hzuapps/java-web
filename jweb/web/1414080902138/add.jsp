<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
<!-- 可选的Bootstrap主题文件（一般不用引入） -->
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<style type="text/css">
body{color:#FF7B0B;font-size:18px;}
.title{text-align: center;font-size:50px;}
.login{text-align: center;}
#id,#name,#sex,#age,#weight,#hight{width:250px; margin:0 auto;}
.btn{width: 125px;}
</style>
  <head>    
    <title>Add Page</title>    
  </head>
  
  <body>
  <h1 class="title"><br/>New Information</h1>
  <div class="container" >
    <form action="123" method="post" class="login"><br>
    <div class="form-group">
    <input type="text" class="form-control" id="id"  name="Username" placeholder="please enter the new id">
  </div>
  <div class="form-group">
    <input type="text" class="form-control" id="name" name="UserPwd" placeholder="please enter the new name">
  </div>
  <div class="form-group">
    <input type="text" class="form-control" id="sex" name="UserPwd" placeholder="please enter the new sex">
  </div>
  <div class="form-group">
    <input type="text" class="form-control" id="age" name="UserPwd" placeholder="please enter the new age">
  </div>
  <div class="form-group">
    <input type="text" class="form-control" id="weight" name="UserPwd" placeholder="please enter the new weight">
  </div>
  <div class="form-group">
    <input type="text" class="form-control" id="hight" name="UserPwd" placeholder="please enter the new hight">
  </div> 
    <input type="submit" value="submit" class="btn btn-primary">&nbsp;&nbsp;&nbsp;
    <input type="reset" value="reset" class="btn btn-primary">
    </form>
  </body>
</html>
