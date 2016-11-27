<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 发帖页面 -->
<html lang="zh-CN">
  <head>
    <title>发帖</title>
    <script type="text/javascript" src="js/ajax.js"></script>
    <script type="text/javascript" src="js/newPosts.js"></script>
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/head.css">
    <link rel="stylesheet" href="css/form.css">
    <link rel="stylesheet" href="css/frame.css">
    <link rel="stylesheet" href="css/content.css">
  </head>
  <body class="new-posts">
    <div class="user">
      <p>欢迎<span class="name">${account.getName()}</span></p>
      <div class="operation">
        <a class="person" href="account.jsp?id=${account.getId()}">个人主页</a>
        <a class="exit" href="login?out=1">退出登录</a>
      </div>
    </div>
    <button class="home" id="home" onClick="gotoHome()">返回主页</button>
    <p class="logo">发表新帖</p>
    <div class="form">
      <div class="item">
        <input class="title" id="title" type="text">
        <div class="tip" id="tip">请填写标题</div><br>
      </div>
      <div class="item"><textarea class="text" id="text"></textarea></div>
      <div class="operation">
        <button class="do" id="Do" onclick="newPosts()">发表</button>
      </div>
    </div>
  </body>
</html>