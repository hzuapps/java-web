<%@page language="java" import="java.util.*" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html >
<head lang="zh-cn">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
    <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
    <title></title>
</head>

<style type="text/css">
    body{
        background: #F0F0F0;
    }

    nav{
        font-family: STXingkai;
        font-size: 17px;
    }
    label {
        font-weight: 100;
    }
    form{
        margin-top: 180px;
    }
</style>

<body>

<%  
  request.setCharacterEncoding("utf-8");
  if(request.getParameter("Username")!= null)
    session.setAttribute("username",request.getParameter("Username"));
  
  if(request.getParameter("Email")!= null)
    session.setAttribute("email",request.getParameter("Email"));
  if(request.getParameter("Password")!= null)
    session.setAttribute("password",request.getParameter("Password"));
 %>
 
<nav class="navbar navbar-default" role="navigation" >
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand">火车票订票服务中心</a>
        </div>
        <ul class="nav navbar-nav">
            <li>
                <a href="#">车票预定</a>
            </li>
            <li>
                <a href="#">我的订单</a>
            </li>
            <li>
                <a href="#">个人信息</a>
            </li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="#"><span class="glyphicon glyphicon-user"></span> 注册</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> 登录</a></li>
        </ul>
    </div>
</nav>

<form role="form" class="form-horizontal" method="post" action="Login.jsp">
    <div class="form-group">
        <label class="control-label col-md-5">用户名 ：</label>
        <div class="col-md-2 has-feedback" >
            <input type="text" name ="Username" class="form-control">
            <span class="glyphicon glyphicon-user form-control-feedback"></span> 
        </div>     
    </div>

    <div class="form-group">
        <label class="control-label col-md-5 ">邮箱 ：</label>
        <div class="col-md-2  has-feedback" >
            <input type="Email" name="Email" class="form-control">
            <span class="glyphicon glyphicon-envelope form-control-feedback"></span> 
        </div>     
    </div>


    <div class="form-group">
          <label class="control-label col-md-5">密码 ：</label>
          <div class="col-md-2  has-feedback " >
             <input type="Password" name="Password" class="form-control">
             <span class="glyphicon glyphicon-lock form-control-feedback"></span> 
          </div>     
    </div>
    <br>

      <div class="col-sm-offset-5">
        <button type="submit" class="btn btn-success" id="submit" name="submit">登录</button>
        <button type="reset" class="btn btn-primary" id="reset" name="reset">取消</button>
      </div>

</form> 
</body>
<html>
