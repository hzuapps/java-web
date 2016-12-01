<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<html lang="zh-CN">
  <head>
    <title>登录MyCMS</title>
    <meta content="charset=utf-8">
    <script type="text/javascript" src="js/ajax.js"></script>
    <script type="text/javascript" src="js/index.js"></script>
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/frame.css">
    <link rel="stylesheet" href="css/content.css">
    <link rel="stylesheet" href="css/form.css">
  </head>
  <body class="index">
    <div class="login">
      <p class="logo">My First CMS</p>
      <div class="form">
        <div class="item"><label for="username">用户名：</label><input id="username" type="text"></div>
        <div class="item"><label for="password">密码：</label><input id="password" type="password"></div>
        <p class="tip" id="tip"></p>
        <div class="operation">
          <button id="loginBtn">登录</button>
          <button id="registerBtn">注册</button>
        </div>
      </div>
    </div>
	</body>
</html>