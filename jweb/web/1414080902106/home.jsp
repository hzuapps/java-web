<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="zh-CN">
  <head>
    <title>欢迎${account.getName()}浏览帖子</title>
    <meta content="charset=utf-8">
    <script type="text/javascript" src="http://cdn.bootcss.com/jquery/3.1.1/jquery.js"></script>
    <script type="text/javascript" src="js/home.js"></script>
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/head.css">
    <link rel="stylesheet" href="css/frame.css">
    <link rel="stylesheet" href="css/content.css">
  </head>
  <body class="home">
    <div class="user">
      <p>欢迎<span class="name">${account.getName()}</span></p>
      <div class="operation">
        <a class="person" href="account.jsp?id=${account.getId()}">个人主页</a>
        <a class="exit" href="login?out=1">退出登录</a>
      </div>
    </div>
    <h1 class="logo">My First CMS</h1>
    <div class="posts">
    <a class="create" id="create" href="./newPosts.jsp">发帖</a>
      <c:forEach items="${posts}" var="current">
        <div class="item" onmousemove="beObvious(this)" onmouseout="beNormal(this)">
          <div class="reply">
            <span class="badge">${current.getReplyCount()}</span>
          </div>
          <a class="title" href="display.jsp?id=${current.getId()}">${current.getTitle()}</a>
          <a class="author" href="account.jsp?id=${current.getAid()}">${current.getName()}</a>
          <div class="datetime">${current.formatDT(current.getCreateDateTime())}</div>
        </div>
      </c:forEach>
    </div>
  </body>
</html>