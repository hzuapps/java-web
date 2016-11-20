<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>在线考试</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
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

        * {
            font-family: "微软雅黑";
        }

        label{
            text-align: right;
            font-size: 18px;
        }

        h2 {
            margin-top: 50px;
            text-align: center;
            margin-bottom: 50px;
        }
        .col-sm-11{
            font-size: 18px;
        }
        .col-sm-10{
            font-size: 18px;
        }
        .boxs{
            border:2px solid #d8dee2;
            border-radius: 8px;
            padding: 10px;
            height:300px;
            margin-bottom:20px;
            background-color: #f5f5f5;
        }
        .checkbox {
            float: left;
            margin-right: 20px;
            margin-top: 40px;
        }
        
         input[type=radio]{
           margin-left: 30px;
        }
        input[type=submit]{
           margin-right: 40px;
        }
    </style>
  </head>
  <body style="background-color: #eee ">
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
        <div class="col-md-3 ">
        </div>
        <div class="col-md-6 container">
            <div>
                <h2>考试科目：<%=request.getAttribute("Message") %></h2>
            </div>
            <div>
                <form action="Do1414080902108" method="get">
                <% int i=1; %>
                <c:forEach var="question" items="${result}">
                <div class="boxs">
                <label class="col-sm-2 control-label">问题<%=i %>:</label>
                <p class="col-sm-10">&nbsp;<c:out value="${question.question}"></c:out></p><br/>
                <label class="col-sm-2 control-label">A:</label>
                <p class="col-sm-10">&nbsp;<c:out value="${question.answer1}"></c:out></p><br/>
                <label class="col-sm-2 control-label">B:</label>
                <p class="col-sm-10">&nbsp;<c:out value="${question.answer2}"></c:out></p><br/>
                <label class="col-sm-2 control-label">C:</label>
                <p class="col-sm-10">&nbsp;<c:out value="${question.answer3}"></c:out></p><br/>
                <label class="col-sm-2 control-label">D:</label>
                <p class="col-sm-10">&nbsp;<c:out value="${question.answer4}"></c:out></p>
                <div class="col-sm-12">
                <div class="col-sm-2"></div>
                <div class="col-sm-7">
                <div class="form-group">
                   <div class="checkbox">
                      <label>
                          <input type="radio" id="inputA" name="answer<%=i %>"  value="A" class="answer"> A
                          <input type="radio" id="inputB" name="answer<%=i %>"  value="B" class="answer"> B
                          <input type="radio" id="inputC" name="answer<%=i %>"  value="C" class="answer"> C
                          <input type="radio" id="inputD" name="answer<%=i++ %>"  value="D" class="answer"> D
                       </label>
                    </div>
                </div>
                <div class="col-sm-3"></div>
                
                        </div>
                </div>
                </div>
                </c:forEach>
                    <br><br><br>
                    <div class="col-sm-4"></div>
                    <div class="col-sm-4">
                    <input type="submit" class="btn btn-primary btn-lg" value="交卷">
                    <input type="button" class="btn btn-primary btn-lg" value="退出">  
                    </div>
                    <div class="col-sm-4"></div> 
                </form>   
            </div>
            <div class="">
                <footer>
                    <p style="text-align: center;margin-top: 260px">&copy;By&nbsp;Bingo1414080902108</p>
                </footer>
            </div>
        </div>
        <div class="col-md-3"></div>
    </div>
</div>
  </body>
</html>
