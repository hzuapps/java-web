<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/> 

	<!-- 网页随屏幕的大小变化而变化 --> 
	<meta name="viewport" content="width=device-width,initial-scale=1.0"> 
	<!-- 支持IE浏览器 --> 
	<meta http-equiv="X-UA-Compatible" content="IE-edge"> 
	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css"> 
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 --> 
   <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script> 
   <!-- 最新的 Bootstrap 核心 JavaScript 文件 --> 
   <script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script> 
   <script src="index.js"></script> 
   
    <style>
    #login_panel
    {
    width: 302px;
    height: 371px;
    top: 92px;
    background-color: rgba(0,0,0,0.05);
    position: relative;
    border-radius: 5px;
    border: 1px solid rgba(201,201,201,0.5);
    float: left;;
    padding-left: 35px;
    padding-right: 35px;
    padding-top: 45px;
    }
    .xform {
        display: block;
        margin-top: 0em;
    }
    .form-icon {
        display: inline-block;
        position: relative;
        max-width: 100%;
    }
    .uk-button {
        -webkit-appearance: none;
        margin: 0;
        overflow: visible;
        font: inherit;
        color: #FFFFFF;
        text-transform: none;
        display: inline-block;
        box-sizing: border-box;
        padding: 0 12px;
        background: #000000;
        vertical-align: middle;
        line-height: 28px;
        min-height: 30px;
        font-size: 12px;
        text-decoration: none;
        text-align: center;
        border: 1px solid rgba(0, 0, 0, 0.06);
        border-radius: 4px;
    }
    .uk-width-1-1 {
        width: 100%;
    }
    .uk-button-large {
        min-height: 40px;
        padding: 0 15px;
        line-height: 38px;
        font-size: 16px;
        border-radius: 5px;
    }
    .uk-margin {
        margin-bottom: 20px;
    }
    .checkbox {
        position: relative;
        display: block;
        margin-top: 10px;
        margin-bottom: 10px;
    }

   
    </style>

</head>
<body>
<div id="login_panel">
    <form class="xform" id="target" method="post" action="login">
        <div class="uk-margin" style="margin-bottom: 5px;">
            <h3>
                     用户登录</h3>
        </div>
        <div class="form-icon " style="height:65px;width:300px;" >
            <input type="text" name="name" placeholder="用户名"  maxlength="35">
        </div>
        <div class="form-icon"  style="height:65px;width:300px;">
            <input type="password" name="password" placeholder="密码"  maxlength="16" onkeypress="if(event.keyCode==13) {login.loginDo();return false;}">
        </div>

        <button class="uk-button uk-width-1-1 uk-button-large uk-margin"  type="submit"  style="margin-top: 5px;">
            登录
        </button>
	
    </form>
    <div id="wx_login" style="width: 302px; height: 300px; overflow: hidden; display: none;"></div>
    

</div>


</body></html>