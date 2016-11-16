<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-cn">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>线路查询系统</title>
    <!-- Bootstrap -->
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">

    <!-- 可选的Bootstrap主题文件（一般不用引入） -->
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script src="index.js"></script>
    <style>
      *{
      	margin:0px;
      	padding:0px;
      }
      /*设置整体框架*/
      #d-all{
      	width: 400px;
        height: 500px;
        background:#F0F0F0;
        border-color: black;
      	border:2px solid black;
        position: absolute;
        left:450px;
        top:50px;
      }
      /*设置顶部框架*/
      #d-all .d-top{
        width:396px;
        height:80px;
      	/*border:1px solid red;
        border-top: none;*/
      	background:#26B1EB;
      }
      /*顶部介绍*/
      #d-all .d-top .d-top-top{
        width:400px;
        height:40px;
        text-align: center;
        line-height: 40px;
        font-weight:700;
        font-size: 12pt;
      }
      /*设置logo*/
      #d-all .d-top .d-top-left{
        width: 80px;
        height:40px;
        text-align: center;
        font-weight: 700;
        line-height: 20px;
        position: absolute;
        top:40px;
      }
      /*设置搜索框*/
      #d-all .d-top form{
        width: 236px;
        height:80px;
        position:absolute;
        left:90px;
        top:40px;
      }
      /*搜索框表单设置*/
      input{
        display: block;
        float:left;
        height:25px;
      }
      /*表单提交按钮*/
      .sub{
        width: 22px;
        height:25px;
        background:url(location1.png);
      }
      /*登录注册区域*/
      #d-all .d-top .right{
        height:50px;
        width:80px;
        position: absolute;
        left:316px;
        top:25px;
      }
      /*登录注册单个区域*/
      #d-all .d-top .right div{
        width:39px;
        height:50px;
        line-height: 50px;
        float: left;
        font-weight: 700;
      }
      #d-all .d-top .right a{
        text-decoration: none;
        color:red;
      }
      a:hover{
        text-decoration: none;
      }
      /*设置两个功能*/
      #d-all .func1{
        width:172px;
        height:72px;
        border:1px solid blue;
        position: absolute;
        top:150px;
        left:110px;
        background:#A1CAE9;
        text-align: center;
        font-weight: 700;
        font-size: 20pt;
        line-height: 72px;
      }
      #d-all .func2{
        width:172px;
        height:72px;
        border:1px solid blue;
        position: absolute;
        top:270px;
        left:110px;
        background:#A1CAE9;
        text-align: center;
        font-weight: 700;
        font-size: 20pt;
        line-height: 72px;
      }
    </style>
  </head>
  <body>
    <% Date date=new Date();%>
    <div id=d-all>
    	<!-- 设置顶部 -->
    	<div class="d-top">
        <!-- 顶部logo -->
        <div class="d-top-top">线路查询系统</div>
        <!-- 动态时间 -->
        <div class="d-top-left">欢迎使用</div>
        <form action="" id="form-all">
          <input type="text" placeholder="输入位置进行定位">
          <input type="submit" value="" class="sub">
        </form>
        <!-- 右边区域 -->
        <div class="right">
          <div><a href="">登录</a></div>
          <div><a href="">注册</a></div>
        </div>
      </div>
    	<!-- 设置中间两个功能 -->
    	<div class="func1"><a href="">路线查询</a></div>
      <div class="func2"><a href="">路线规划</a></div>
    </div>
  </body>
</html>