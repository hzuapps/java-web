<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-cn">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>登录 - TodoX</title>

    <link href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/login.css">

    <!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
    <div class="container">
	    <form class="login" role="form" method="post" action="login">
	    <c:if test="${!empty tip}">
			   <p class="tip bg-danger">:( 登录失败：<c:out value="${tip}"></c:out></p>
		</c:if>
        <div class="form-group">
          <label for="exampleInputEmail1">邮箱</label>
          <input type="email" name="email" class="form-control" id="exampleInputEmail1" placeholder="请输入邮箱">
        </div>
        <div class="form-group">
          <label for="inputPassword3">密码</label>
          <input type="password" name="password"class="form-control" id="inputPassword3" placeholder="请输入密码">
        </div>
        <div class="checkbox">
          <label>
            <input type="checkbox" name="remember" value="1"> 30天内免登录
          </label>
        </div>
        <button type="submit" class="btn btn-primary btn-block">登录</button>
      </form>
    </div>
    <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
  </body>
</html>