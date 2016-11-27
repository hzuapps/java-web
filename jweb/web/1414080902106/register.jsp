<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<html>
  <head>
    <title>账号注册</title>
    <meta content="charset=utf-8">
    <script type="text/javascript" src="js/ajax.js" ></script>
    <script type="text/javascript" src="js/register.js" ></script>
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/head.css">
    <link rel="stylesheet" href="css/form.css">
    <link rel="stylesheet" href="css/content.css">
    <link rel="stylesheet" href="css/frame.css">
  </head>
  <body class="register">
    <div class="user"><div class="operation">
      <a class="home" href="./">返回主页</a>
    </div></div>
    <p class="logo">My First CMS</p>
    <div class="form">
      <div class="item"><label>用户名：</label><input id="username" type="text"></div>
      <div class="item"><label>昵称：</label><input id="Name" type="text"></div>
      <div class="item"><label>密码：</label><input id="password" type="password"></div>
      <div class="item">
        <label>确认密码：</label><input id="password2" type="password">
        <p class="tip" id="pwdTip">输入了确认密码才能注册</p>
      </div>
      <p class="tip" id="tip"></p>
      <div class="operation">
        <button id="registerBtn">确认注册</button>
        <button id="resetBtn">重置</button>
      </div>
    </div>
  </body>
</html>