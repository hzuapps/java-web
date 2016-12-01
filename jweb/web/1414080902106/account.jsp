<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="zh-CN">
  <head>
    <c:if test="${other.getId() == account.getId()}">
      <title>我的个人主页</title>
    </c:if>
    <c:if test="${other.getId() != account.getId()}">
      <title>${other.getName()}的个人主页</title>
    </c:if>
    <meta content="charset=utf-8">
    <script type="text/javascript" src="js/ajax.js"></script>
    <script type="text/javascript" src="js/account.js"></script>
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/head.css">
    <link rel="stylesheet" href="css/frame.css">
    <link rel="stylesheet" href="css/content.css">
  </head>
  <body class="account">
    <div class="user">
      <p>欢迎<span class="name">${account.getName()}</span></p>
      <div class="operation">
        <a class="person" href="account.jsp?id=${account.getId()}">个人主页</a>
        <a class="exit" href="login?out=1">退出登录</a>
      </div>
    </div>
    <button class="home" id="home" onClick="gotoHome()">返回主页</button>
    <c:if test="${other.getId() == account.getId()}">
      <button class="remove" id="remove" title="删除账号" onClick="removeAccount(${account.getUsername()})">注销账号</button>
      <div class="logo">我发表过的帖子</div>
    </c:if>
    <c:if test="${other.getId() != account.getId()}">
      <div class="logo">${other.getName()}发表过的帖子</div>
    </c:if>
    <div class="posts">
    <c:forEach items="${posts}" var="current">
      <div class="item" onmousemove="beObvious(this)" onmouseout="beNormal(this)">
        <span class="badge">${current.getReplyCount()}</span>
        <a class="title" href="./display.jsp?id=${current.getId()}">${current.getTitle()}</a>
        <div class="datetime">${current.getCreateDateTime()}</div>
      </div>
    </c:forEach>
    </div>
  </body>
</html>