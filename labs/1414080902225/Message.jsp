<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <title>成绩填写</title>
    <script src="js/jquery-1.7.1.min.js"></script>
	
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <%@page import="java.text.*" %>
	<%@page import="java.util.Date,java.lang.*" %>
  </head>
  
  <body>
    
    <nav class="navbar navbar-inverse" role="navigation">
        <div class="container-fluid">
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
              <ul class="nav navbar-nav">
                <li class="active"><a href="#">首页</a></li>
                
                <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">详情 <span class="caret"></span></a>
                  <ul class="dropdown-menu" role="menu">
                    <li><a href="#">精神文明</a></li>
                    <li><a href="#">技术水平</a></li>
                    <li><a href="#">社会实践</a></li>
                    <li class="divider"></li>
                    <li><a href="#">帮助</a></li>
                    <li class="divider"></li>
                    <li><a href="#">关于我们</a></li>
                  </ul>
                </li>
              </ul>
            </div>
        </div>            
    </nav>

    <div class="row">
      
      <div class="col-md-9">
        <ol class="breadcrumb">
            <li><a href="#">主页</a></li>
            <li><a href="#">个人</a></li>
            <li class="active">成绩</li>   
        </ol>
      </div>
      
      <%!Date date=new Date(); %>
      <%!DateFormat df= DateFormat.getDateTimeInstance(); %>
      <div class="col-md-3">
        <div class="col-md-4">
        	<span ><%=df.format(date) %></span> 
        </div>
        <div class="col-md-4">
            <button type="button" class="btn btn-info btn-sm">
                <span class="glyphicon glyphicon-user"></span> 
                <%String userName =request.getParameter("user"); %>
                <label>你好！<%=userName %>,欢迎登录</label>
            </button>
        </div>
        
        <div class="col-md-4">
        
      </div>

    </div>
    <div class="container-fluid">
        <div class="col-md-2 "></div>  
        <div class="col-md-8 bg-success">
            <h2><span class="label label-primary col-md-offset-5">成绩</span></h2>
            <hr>
            <form class="form-horizontal" role="form" method="post" action="">
                
                <div class="form-group">
                    <label for="subject4" class="col-md-4 control-label">离散数学</label>
                    <div class="col-md-4">
                         <input type="text" class="form-control" id="subject4" >
                    </div>
                </div>

                
                <div class="form-group">
                    <label for="subject6" class="col-md-4 control-label">汇编语言</label>
                    <div class="col-md-4">
                         <input type="text" class="form-control" id="subject6" >
                    </div>
                </div>

                <div class="form-group">
                    <label for="subject2" class="col-md-4 control-label">大学英语4</label>
                    <div class="col-md-4">
                         <input type="text" class="form-control" id="subject2" >
                    </div>
                </div>

                <div class="form-group">
                    <label for="subject3" class="col-md-4 control-label">公共体育4</label>
                    <div class="col-md-4">
                         <input type="text" class="form-control" id="subject3" >
                    </div>
                </div>

                <div class="form-group">
                    <label for="subject8" class="col-md-4 control-label">数据库系统概论</label>
                    <div class="col-md-4">
                         <input type="text" class="form-control" id="subject8" >
                    </div>
                </div>

                <div class="form-group">
                    <label for="subject5" class="col-md-4 control-label">计算机组成原理</label>
                    <div class="col-md-4">
                         <input type="text" class="form-control" id="subject5" >
                    </div>
                </div>

                <div class="form-group">
                    <label for="subject7" class="col-md-4 control-label">马克思主义基本原理</label>
                    <div class="col-md-4">
                         <input type="text" class="form-control" id="subject7" >
                    </div>
                </div>

                <div class="form-group">
                    <label for="subject1" class="col-md-4 control-label">数据库系统课程设计</label>
                    <div class="col-md-4">
                         <input type="text" class="form-control" id="subject1" >
                    </div>
                </div>

                <div class="form-group" id="s">
                    
                    <div class="col-md-offset-7" id="sub">
                         <input type="button" class="btn btn-success" value="完成" id="subm">
                    </div>
                </div>   
            </form>
        </div> 
        <div class="col-md-2 "></div>  
        <div class="col-md-12 "></div>     
    </div>

    <script>
    $(document).ready(function() {
        
        var data={};
        $("#subm").click(function(){

            if($("#subject1").val()!="" && $("#subject2").val()!="" && $("#subject3").val()!="" && $("#subject4").val()!="" && $("#subject5").val()!="" && $("#subject5").val()!="" && $("#subject7").val()!="" && $("#subject8").val()!="")
            {
                var result="保存成绩：\n"+"离散数学："+$("#subject4").val()+"\n汇编语言："+$("#subject6").val()+
                       "\n大学英语4："+$("#subject2").val()+"\n公共体育4："+$("#subject3").val()+
                       "\n数据库系统概论："+$("#subject8").val()+"\n计算机组成原理："+$("#subject5").val()+
                       "\n马克思主义基本原理："+$("#subject7").val()+"\n数据库系统课程设计："+$("#subject1").val();
                alert(result);
            }

            else
            {
                alert("成绩不允许有空！");

            }
            
            
            

        })
    });


        $.ajax(
            {
               type: "POST",
               url: "success.json",
               data: {name:"John", location: "Boston"}
               
            }).done(function( subject1 ) 
         {
            $("#subject4").val(String (subject1["subject1"]));
             $("#subject6").val(String (subject1["subject2"]));
              $("#subject2").val(String (subject1["subject3"]));
               $("#subject3").val(String (subject1["subject4"]));
                $("#subject8").val(String (subject1["subject5"]));
                 $("#subject5").val(String (subject1["subject6"]));
                  $("#subject7").val(String (subject1["subject7"]));
                   $("#subject1").val(String (subject1["subject8"]));

            alert( "保存成绩:\n "+ 
                "离散数学："+subject1["subject1"]+"\n汇编语言："+subject1["subject2"]+
                "\n大学英语4："+subject1["subject3"]+"\n公共体育4："+subject1["subject4"]+
                "\n数据库系统概论："+subject1["subject5"]+"\n计算机组成原理："+subject1["subject6"]+
                "\n马克思主义基本原理："+subject1["subject7"]+"\n数据库系统课程设计："+subject1["subject8"]
                );
         });
    </script>
   
  </body>
</html>
