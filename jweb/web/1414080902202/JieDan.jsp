<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
<meta charset="utf-8">
 <!-- 新 Bootstrap 核心 CSS 文件 -->
 <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
 <!-- 可选的Bootstrap主题文件（一般不用引入） -->
 <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">
 <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
 <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
 <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
 <script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
 <script src="index.js"></script>
 <style type="text/css">
 body{
   background-color:#FFCC00;
 }
.text2{border:3px;width:350px;height:50px;font-size:16px;line-height:1.6;}
.bt{
      width:100px; 
    }
 </style>
 <head>
 <title>车主接单界面</title>
 </head>
 <body bgcolor="yellow">
 <form action=""method="post"id="target">
 <p><font size="6"color="#FFFFFF">祝君一路平安</font></p>
 <hr size="15px" noshade>
<p>
<a href="http://developer.baidu.com/map/carhome.htm"><font size="5"color="#ffffff">请您确认所在位置！(查看定位)</font></a>
</p>
<p>
<input style="background:#ffffff;color:black;width:80px;height:40px;"type="submit"class="btn0"id="button0"value="位置正确"></input>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input style="background:#ffffff;color:black;width:80px;height:40px;"type="submit"class="but1"id="button1"value="位置错误"></input>
</p>
<p>
<font size="5"color="#ffffff"><b>您要接：</b></font>
</p>
<p>
<input type="checkbox"name="way1"value="A1"><font size="4"color="#ff6600">长途订单</font></input>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="checkbox"name="way2"value="A2"><font size="4"color="#ff6600">短途订单</font></input>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</p>
<br>
<p><font size="5"color="#ffffff">确认后，系统会自动为您匹配最优质的客户。</font></p>
<br>
<p align="center">
<input style="background:#ffffff;color:black;width: 250px; height: 50px;"type="submit"class="btn"id="button1"value="确定寻找"></input>
</p>
 </form>
 </body>
