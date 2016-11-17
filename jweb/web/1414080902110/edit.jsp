<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>文章编辑页面</title>
    <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
    <link href="http://cdn.bootcss.com/bootstrap/2.3.2/css/bootstrap.min.css" rel="stylesheet" />
    <script src="http://cdn.bootcss.com/bootstrap/2.3.2/js/bootstrap.min.js"></script>
    <style type="text/css">
    form{
     margin-top: 10px;
     font-family: "微软雅黑";
     font-size: 16px;
     text-align: center;
    }
    .content{
       width:37%;
    }
    </style>
  </head>
  
  <body>
  <img src="http://localhost:8080/musicForum/images/adv.jpg">
  <form action="/musicForum/edit" method="post">
       文章标题：<input type="text"  name="essay_title" >
       文章类别：<input type="text" name="classify" >
       <br>
       文章内容：<textarea rows="5" cols="20" name="essay_content" class="content"></textarea>
       <br>
       <input type="submit" class="btn btn-danger " value="提交">
       <input type="reset" class="btn btn-danger " value="重置">
  </form>
  </body>
</html>
