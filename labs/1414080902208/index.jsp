<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta charset="utf-8">
    <title>注册页面</title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
      <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">

    <!-- 可选的Bootstrap主题文件（一般不用引入） -->
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script src="index.js"></script>
  </head>
  <body>
    <form role="form">
    <div class="form-group">
    <label for="Username">用户名</label>
    <input type="name" class="form-control" required novalidate="true" id="Username" placeholder="username">
    </div>
    <div class="form-group">
    <label for="Title">标题</label>
    <input type="title" class="form-control" required novalidate="true" id="Title" placeholder="title">
    </div>
    <div class="form-group">
    <label for="Article">文章</label>
    <input type="article" class="form-control" required novalidate="true" id="Article" placeholder="article">
    </div>
   
    <button type="signin" class="btn btn-default">发布作品</button>
    </form>
    <form role="form">
    <div class="form-group">
    <label for="Title">标题</label>
    <input type="title" class="form-control" required novalidate="true" id="Title" placeholder="title">
    </div>
    
   
    <button type="signin" class="btn btn-default">查看文章</button>
    </form>
  </body>
</html>