<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>注册</title>
    
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
        .navbar {
            min-height: 30px;
            margin-bottom: 0;
            border-radius: 0;
        }

        .lead {
            margin-top: 2px;
            font-size: 15px;
            font-weight: normal;
            margin-left: 30px;
        }

        h4 {
            font-weight: bold;
        }

        footer p {
            font-weight: bold;
        }

        label {
            margin-top: 10px;
        }

        input {
            margin-top: 2px;
        }

        select {
            margin-top: 2px;
        }

        .pid {
            color: #a94442;
            font-size: 13px;
        }
    </style>
  </head>
  
  <body>
    <div class="">
    <nav class="navbar navbar-inverse" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                        data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.jsp">在线考试系统</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-left">
                    <!--<li><a href="#">&nbsp;</a></li>-->
                    <li class="dropdown">
                        <a href="" class="dropdown-toggle" data-toggle="dropdown">功能<span class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="index.jsp">首页</a></li>
                            <li class="divider"></li>
                            <li><a href="#">新增试题</a></li>
                            <li><a href="#">查询成绩</a></li>
                            <li><a href="#">快速考试</a></li>
                            <li class="divider"></li>
                            <li><a href="#">账号管理</a></li>
                            <li class="divider"></li>
                            <li><a href="#">后台管理</a></li>
                        </ul>
                    </li>
                </ul>
                <form class="navbar-form navbar-left" role="search">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Search">
                    </div>
                    <button type="submit" class="btn btn-default">Search</button>
                </form>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#">关于我们</a></li>
                    <li><a href="#">帮助</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                         <c:if test="${name != null}">欢迎，<%=session.getAttribute("name") %></c:if> 
                         <c:if test="${name == null}">我的</c:if> 
                         <span class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="#">修改信息</a></li>
                            <li><a href="#">我的记录</a></li>
                            <li><a href="#">意见反馈</a></li>
                            <li class="divider"></li>
                            <li>
                            <% String flag="";
                               Object obj = session.getAttribute("flag");
                               if(obj != null){
                                flag = obj.toString();
                               }
                               if(flag.equals("login_success")){
                             %>
                             <a href="<%=request.getContextPath() %>/LogoutSe1414080902108">退出</a>
                             <% }else{ %>
                             <a href="<%=request.getContextPath() %>/sign.jsp">登录</a>
                             <%} %>
                            </li>
                            <li><a href="<%=request.getContextPath() %>/sign_up.jsp">注册</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>
    <div class="">
        <div class="row" style="background-color: #eee">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <!--<h2 style="text-align: center">教师信息注册</h2>-->
                <div>
                    <h1>Join in Exam System</h1>

                    <p class="lead">The Best System to design and finish a Exam</p>
                    <h4>Create your personal account</h4>
                </div>
                <form role="form" id="row">
                    <label for="InputId">ID Number</label>

                    <p class="pid">The ID can't be empty</p>

                    <div class="input-group ">
                        <span class=" glyphicon glyphicon-star input-group-addon"></span>
                        <input type="text" class="form-control" id="InputId" placeholder="Enter ID Number">
                        <span class="checkId"></span>
                    </div>
                    <label for="InputUserName">Name</label>

                    <p class="pid">The Name can't be empty</p>

                    <div class="input-group">
                        <span class=" glyphicon glyphicon-user input-group-addon"></span>
                        <input type="text" class="form-control" id="InputUserName" placeholder="Enter Name">
                        <span class="checkId"></span>
                    </div>
                    <label for="InputPassword1">Password</label>

                    <p class="pid">The Password can't be empty</p>

                    <div class="input-group">
                        <span class="glyphicon glyphicon-lock input-group-addon"></span>
                        <input type="password" class="form-control" id="InputPassword1"
                               placeholder="Enter Password">
                        <span class="checkId"></span>
                    </div>

                    <label for="InputEmail1">Email address</label>

                    <p class="pid">The Email can't be empty</p>

                    <div class="input-group">
                        <span class=" glyphicon glyphicon-envelope input-group-addon"></span>
                        <input type="email" class="form-control" id="InputEmail1" placeholder="Enter email">
                        <span class="checkId"></span>
                    </div>
                    <label for="InputSchool">School</label>

                    <p class="pid">The School can't be empty</p>

                    <div class="input-group">
                        <span class=" glyphicon glyphicon-home input-group-addon"></span>
                        <input type="text" class="form-control" id="InputSchool" placeholder="Enter School">
                        <span class="checkId"></span>
                    </div>

                    <label>Sex</label><br/>

                    <div class="input-group">
                        <span class=" glyphicon glyphicon-heart-empty input-group-addon"></span>
                        <select class="form-control">

                            <option>Man</option>
                            <option>Woman</option>

                        </select>
                    </div>
                    <label>Status</label><br/>

                    <div class="input-group">

                        <span class=" glyphicon glyphicon-briefcase input-group-addon"></span>
                        <select class="form-control">

                            <option>Teacher</option>
                            <option>Student</option>

                        </select>
                    </div>

                    <div class="input-group">


                        <hr/>
                    </div>
                    <button type="submit" class="btn btn-success" id="submit">Submit</button>
                    <button type="reset" class="btn btn-primary" id="reset">Reset</button>
                </form>
                <hr/>
                <div class="">
                    <footer>
                        <p style="text-align: center">&copy;By&nbsp;Bingo1414080902108</p>
                    </footer>
                </div>
            </div>
            <div class="col-md-3"></div>
        </div>
     </div>
   </div>
   <script>
   var m1 = false;
   var m2 = false;
   var m3 = false;
   var m4 = false;
   var m5 = false;


$(document).ready(function () {
    $(".pid").hide();
    $("#row").submit(function (event) {
        if ($("#InputId").val() == "" || $("#InputUserName").val() == "" ||
            $("#InputEmail1").val() == "" || $("#InputPassword1").val() == "" ||
            $("#InputSchool").val() == "") {
            IsEmpty("#InputId");
            IsEmpty("#InputUserName");
            IsEmpty("#InputEmail1");
            IsEmpty("#InputPassword1");
            IsEmpty("#InputSchool");
        }
        else {
            
        }
        event.preventDefault();
    });

    $("#reset").on("click", function () {
        m1 = false;
        m2 = false;
        m3 = false;
        m4 = false;
        m5 = false;

        $(".pid").hide();
        $("input").parent().removeClass("has-success");
        $("input").parent().removeClass("has-error");
        $("input").next().removeClass("glyphicon-ok");
        $("input").next().removeClass("glyphicon-remove");
    });

    $("body").on("click", function () {
        IsShow("#InputId", m1);
        IsShow("#InputUserName", m2);
        IsShow("#InputEmail1", m3);
        IsShow("#InputPassword1", m4);
        IsShow("#InputSchool", m5);
    });


    $("#InputId").on("click", function () {
        m1 = true;
    })
    $("#InputUserName").on("click", function () {
        m2 = true;
    })
    $("#InputEmail1").on("click", function () {
        m3 = true;
    })
    $("#InputPassword1").on("click", function () {
        m4 = true;
    })
    $("#InputSchool").on("click", function () {
        m5 = true;
    })
});

function IsEmpty(i) {
    $(i).next().addClass("glyphicon");
    $(i).next().addClass("form-control-feedback");
    $(i).parent().addClass("has-feedback");
    if ($(i).val() == "") {
        $(i).parent().removeClass("has-succeed");
        $(i).next().removeClass("glyphicon-ok");
        $(i).parent().addClass("has-error");
        $(i).next().addClass("glyphicon-remove");
        $(i).parent().prev().show();
    }
    else {
        $(i).parent().removeClass("has-error");
        $(i).next().removeClass("glyphicon-remove");
        $(i).parent().addClass("has-success");
        $(i).next().addClass("glyphicon-ok");
        $(i).parent().prev().hide();
    }
}

function IsShow(i, m) {
    if ($(i).is(":focus") == false) {
        if (m == true) {
            IsEmpty(i);
        }
    }
}
   </script>
  </body>
</html>
