<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="zh-CN">
  <head>
    <title>${posts.getTitle()}</title>
    <meta content="charset=utf-8">
    <script type="text/javascript" src="js/ajax.js"></script>
    <script type="text/javascript" src="js/display.js"></script>
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/head.css">
    <link rel="stylesheet" href="css/frame.css">
    <link rel="stylesheet" href="css/content.css">
  </head>
  <body class="display">
    <div class="user">
      <p>欢迎<span class="name">${account.getName()}</span></p>
      <div class="operation">
        <a class="person" href="account.jsp?id=${account.getId()}">个人主页</a>
        <a class="exit" href="login?out=1">退出登录</a>
      </div>
    </div>
    <button class="home" id="home" onClick="gotoHome()">返回主页</button>
    <div class="posts">
      <div class="reply">
        <span class="count">${posts.getReplyCount()}</span>回复
      </div>
      <div class="title">${posts.getTitle()}</div>
      <div class="main">
        <div class="author">
          <a class="name" href="./account.jsp?id=${posts.getAid()}">${posts.getName()}</a>
        </div>
        <div class="content">
          <div class="text">${posts.getText()}</div>
          <div class="datetime">${posts.formatDT(posts.getCreateDateTime())}</div>
          <div class="operation">
            <button class="reply" onClick="gotoReply1()">我来说一句</button>
            <c:if test="${posts.getAid() == account.getId()}">
              <button class="delete" onclick="removePosts(${posts.getId()})">删除</button>
            </c:if>
          </div>
        </div>
      </div>
      <c:forEach items="${reply1}" var="current">
        <div class="reply">
          <div class="author">
            <a class="name" href="./account.jsp?id=${current.getAid()}">${current.getName()}</a>
          </div>
          <div class="content">
            <div class="text">${current.getText()}</div>
            <div class="datetime">${current.formatDT(current.getCreateDateTime())}</div>
            <div class="operation">
              <button class="check" openReply2="no" loadReply2="no" onClick="onReply2Btn(this, ${current.getId()}, ${account.getId()})">查看回复</button>
              <c:if test="${current.getAid() == account.getId()}">
                <button class="delete" onclick="removeReply1(${current.getId()})">删除</button>
              </c:if>
            </div>
            <div class="reply">
              <div class="old"></div>
              <div class="new">
                <textarea class="text"></textarea>
                <button class="do" onClick="reply2(this, ${current.getId()}, ${account.getId()})">我来说一句</button>
              </div>
            </div>
          </div>
        </div>
      </c:forEach>
      <div class="reply"><div class="new">
        <textarea class="text" id="reply"></textarea>
        <button class="do" onClick="reply1(${posts.getId()})">回复</button>
      </div></div>
    </div>
    <!-- 以下是2级回复的模板 -->
    <div id="model" class="item">
      <div class="author">
        <a class="name" href=""></a>
      </div>
      <div class="content">
        <div class="text"></div>
        <div class="datetime"></div>
        <div class="operation"></div>
      </div>
    </div>
  </body>
</html>