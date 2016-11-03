<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>邮箱登录</title>
    
  </head>

  <body>

    <div class="container">

     <form action="" method="post" id="target">
                          姓名：<input name="rdName"><br>
                          电话：<input name="phName"><br>
                          地址：<input name="phName"><br>
          <input type="submit" value="提交">
      </form>
    </div> 
    <hr>
    <p>程序运行时间：<%=new Date() %></p>

    <script src="./index.js"></script>
  </body>
</html>
