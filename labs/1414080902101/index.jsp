<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MyJsp.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  
  <style>
body{padding-bottom: 0px; margin: 0px; padding-left: 0px; padding-right: 0px; font-family: "Arial"; background: url(images/9552.jpg) #6CF; color: #F99; font-size: 13px; padding-top: 0px}

#login{ padding-bottom: 20px; margin: 0px auto; padding-left: 20px; width: 247px; padding-right: 20px; padding-top: 20px; border-radius: 4px 4px 4px 4px}

P{margin: 10px 0px}
.hy input{border-bottom: #cccccc 1px solid; border-left #cccccc 1px solid; padding-bottom: 4px;  background-color: #ffffff; padding-left: 6px;width: 206px; padding-right: 20px; font-family: "Arial";margin-bottom: 10px; height: 20px; margin-left: 0px; font-size: 14px; border-top: #cccccc 1px solid; border-right: #cccccc 1px solid; padding-top: 4px; }

.remember-me{margin-top: 0px; display: block; magin-bottom: 25px}

.remember-me input{vertical-align: middle; cursor: pointer}

.remember-me label{font-size: 13px; vertical-align: middle; cursor: pointer}

.remember-me a{color:  #F99;  padding-top: 1px}

.remember-me A:hover{border-bottom: #999 1px dashed;color: #999  }

.login-btn input{border-bottom: 1px solid; border-left: 1px solid; padding-bottom: 4px; line-height: 20px; background-color: #f56c06; margin: 0px auto; padding-left: 12px; width: 80px; padding-right: 12px; display: block;  color: #ffffff; font-size: 13px; border-top: 1px solid; cursor: pointer; border-right: 1px solid; padding-top: 4px; border-radius: 4px 4px 4px 4px;  }
.login-btn input:hover{background-color:#F90}
</style>
</head>

<form id="loginform" method="post" action="/#/"align="center"> 

<div class="hy">
  <div ><span class="icon-user"></span>
      <input type="text" name="username" placeholder="Username">
  </div>
</div>
<div class="hy">
  <div >
      <input type="password" name="password" placeholder="Password"> 
  </div>
</div>
<div class=remember-me>
<input id="rm" value="1" type="checkbox" name="remember">
<label >记住我</label>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;  <a id="forget-password" href="https://www.baidu.com/index.php?tn=site888_3_pg&ssl_s=1&ssl_c=ssl1_150a7678c4c"display="inline">忘记密码?</a>
</div>
<div class=login-btn>
<input id="login-btn" value="登 录"onclick="open_win()" type="button" name="submit"></div>
</form>
</hr>
<center>
 现在的日期和时间是：<%=new Date() %>>
</center>
  </body>
</html>
