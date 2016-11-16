<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">
    <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <style>
    body {
        padding-top: 40px;
        padding-bottom: 40px;
        background-color: #eee;
    }

    .form-signin {
        max-width: 400px;
        padding: 25px;
        margin: 0 auto;
        border: 1px solid #d8dee2;
        border-radius: 8px;
        background-color: #f5f5f5;
    }
    .form-signin .form-signin-heading,
    .form-signin .checkbox {
        margin-bottom: 10px;
    }
    .form-signin .checkbox {
        font-weight: normal;
    }
    .form-signin .form-control {
        position: relative;
        height: auto;
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
        padding: 10px;
        font-size: 16px;
    }
    .form-signin .form-control:focus {
        z-index: 2;
    }
    .form-signin input[type="text"] {
        margin-bottom: 10px;
        border-bottom-right-radius: 0;
        border-bottom-left-radius: 0;
    }
    .form-signin input[type="password"] {
        margin-bottom: 10px;
        border-top-left-radius: 0;
        border-top-right-radius: 0;
    }
    h1{
        text-align: center;
        font-weight: 100;
        -webkit-margin-before: 0.67em;
        -webkit-margin-after: 0.67em;
        -webkit-margin-start: 0px;
        -webkit-margin-end: 0px;
        margin-bottom: 70px;
        color: #333;
    }
    a{

    }
    a:hover{
        text-decoration: none;
        cursor: pointer;
    }

  </style>
  </head>
  
  <body>
    <div class="container">

    <h1 class="form-signin-heading">Sign in to Exam System</h1>
    <form class="form-signin" role="form" method="post" action="LoginSe1414080902108">
        <% if(request.getAttribute("return_uri") != null){ %>
        <input type="hidden" name="return_uri" value="<%=request.getAttribute("return_uri") %>" />
        <%} %> 
        <p>UserName</p>
        <input type="text" name="userName" class="form-control" placeholder="UserName">
        <p>Password</p>
        <input type="password"  name="password" class="form-control" placeholder="Password">

        <div class="checkbox">
            <p><a>Forget Password?</a></p>
            <label>
                <input type="checkbox" value="remember-me"> Remember me
            </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
    </form>

    </div>
    <!-- /container -->
<<!-- script>
    $(document).ready(function(){
       $(".form-signin").submit(function(event){
           event.preventDefault();
       })
    });
</script> -->
  </body>
</html>
