<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head> 
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">

<!-- 可选的Bootstrap主题文件（一般不用引入） -->
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
</head>

<%
  int i=0;
  int j=i+1;
%>

<body>
<meta charset=utf-8>
<form role="form" >
  <div class="form-group">
    <label for="search" class="col-sm-2 control-labal">
    查找问卷</label>
    <div class="col-sm-10">
       <input type="search" class="form-control" id="search" placeholder="请输入关键字或问卷编号" >
    </div>
  <button type="submit" class="btn btn-default">查找</button><br><br>
  <input type="button" value="创建问卷">
</form>

</body>
</html>