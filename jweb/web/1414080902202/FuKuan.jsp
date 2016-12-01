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
 <style type="text/css">
 body{
   background-color:#FFCC00;
 }
.text2{border:2px;width:150px;height:30px;font-size:12px;}
.bt{
      width:100px; 
    }
 </style>
 <head>
 <title>客户付款界面</title>
 </head>
 <body bgcolor="yellow">
<form action=""method="post"id="target">
<p><font size="6"color="#FFFFFF">尊敬的客户，感谢使用某滴出行。</font></p>
<p><input style="background:#ffffff;color:black;width: 250px; height: 50px;"type="submit"class="btn"id="button1"value="已经到达目的地。我要付款。"></input></p>
<p>请按照以下提示输入：</p> 
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>用&nbsp;&nbsp;户&nbsp;&nbsp;名：</b><input name="textfield3"type="text"class="text3"id="textfield33"value="用户名/邮箱/手机号"/></P>
<p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话：</b><input name="textfield4"type="password"class="text4"id="textfield44"value=""/></p>
 <p>
<font size="5"color="black"><b>支付方式：</b></font>
</p>
<p>
<input type="checkbox"name="way1"value="A1"><font size="4"color="#ff6600">微信</font></input>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="checkbox"name="way2"value="A2"><font size="4"color="#ff6600">支付宝</font></input>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="checkbox"name="way3"value="A3"><font size="4"color="#ff6600">银行卡</font></input>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="checkbox"name="way4"value="A4"><font size="4"color="#ff6600">其他</font></input>
</p>
<p>
<input style="background:#ffffff;color:black;width: 150px; height: 50px;"type="submit"class="btn"id="button1"value="确认支付"></input>
<input style="background:#ffffff;color:black;width: 150px; height: 50px;"type="submit"class="btn"id="button1"value="取消支付"></input>
</p>
 </body>
