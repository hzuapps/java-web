<%@page import="java.sql.Date"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>欢迎登录</title>
    
    <meta charset="utf-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
  </head>
  
  <body> 
    <nav class="navbar navbar-inverse" role="navigation">
    </nav>
     
    <div class="container-fluid" id="main">
        <div class="col-md-2 "></div>  
        <div class="col-md-8 bg-success" >
            <br>
            <br>
            <br>
            <form class="form-horizontal " role="form" method="post" action="Message.jsp" >
                <div class="form-group">
                    <label class="col-md-2 control-label" for="userName">UserName:</label>
                    <div class="col-md-4">
                         <input type="text" id="userName" class="form-control" placeholder="Hurrican" name="user">
                    </div>
                </div>


                <div class="form-group">
                    <label class="col-md-2 control-label" for="pwd">Password:</label>
                    <div class="col-md-4">
                         <input type="password" id="pwd" class="form-control" placeholder="*********">
                    </div>           
                </div>

                
                <div class="form-group">
                    <div class="col-md-offset-4 col-md-8" >
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" >Remember me
                            </label>
                        </div>
                    </div>
                </div> 


                <div class="col-md-offset-4">
                    <div class="btn-group">
                        <input type="submit" class="btn btn-success" value="Register" id="login" onclick="return chkform()">
                        <input type="reset" class="btn btn-warning" value="Reset" >
                    </div>  
                </div>       
            </form>
        </div> 
        <div class="col-md-2 "></div>  
        <div class="col-md-12 "></div>     
    </div>

    <script type="text/javascript">

        var checkUserName=document.getElementById("userName");
            var checkUserPwd=document.getElementById("pwd");
            var submit=document.getElementById("login");
           
            function chkform()
            { 
                 if(checkUserName.value=="")
                 { 
                      alert("用户名不能为空！"); 
                      return false; 
                 } 

                 if(checkUserPwd.value=="") 
                 { 
                      alert("密码不能为空！"); 
                      return false; 
                 }  
                 self.location='Message.jsp';  

             };
    </script>
    
  </body>
</html>
