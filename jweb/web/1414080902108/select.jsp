<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="edu.hzu.javaweb.labs.se1414080902108.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
        QuestionDAO dao = new QuestionDAO();
		List<Question> questionlist = new ArrayList<Question>();
		try {
			questionlist = dao.findSubject();
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("result", questionlist);
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>查询成绩界面</title>
    
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
        .top{
            background-color: #eeeeee;
            background-image: linear-gradient(180deg, rgba(255,255,255,0) 60%, #fff),linear-gradient(70deg, #fffae3 10%, #e0f1ff);
        }
        *{
            font-family: "微软雅黑";
        }
        a:hover{
            text-decoration:none;
        }
        .jumbotron{
            background-image: linear-gradient(180deg, rgba(255,255,255,0) 60%, #fff),linear-gradient(70deg, #fffae3 10%, #e0f1ff);
        }
        select{
            float: left;
        }

        input{
            float: left;
            margin-right: 10px;
        }
        .jumbotron p{
            font-weight: 800;
            text-align: right;
        }
        #title{
            font-size: 40px;
            font-weight: 800;
            text-align: center;
        }
    </style>

  </head>
  
  <body>
     <% Calendar rightNow = Calendar.getInstance();
       Integer Hour = new Integer(rightNow.get(Calendar.HOUR_OF_DAY));
       request.setAttribute("hour", Hour);
     %>
    <div class="top">
    <nav class="navbar navbar-inverse navbar-top" role="navigation">
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
                            <li><a href="add.jsp">新增试题</a></li>
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

<!-- Main jumbotron for a primary marketing message or call to action -->
<div class="jumbotron">
    <div class="container">
        <h2>
        <c:if test="${hour>=0 && hour <=1}">夜深了,</c:if>
        <c:if test="${hour>=3 && hour <=11}">上午好,</c:if>
        <c:if test="${hour>=12 && hour <=13}">中午好,</c:if>
        <c:if test="${hour>=14 && hour <=17}">下午好,</c:if>
        <c:if test="${hour>=18 && hour <=22}">晚上好,</c:if>
        <c:if test="${hour>=23}">夜深了,</c:if>
        <c:if test="${name != null}"><%=session.getAttribute("name") %></c:if>
        <c:if test="${name == null}"><a href="sign.jsp">请先登录</a></c:if>
        <br>
        </h2><br/><br/>
        <div class="container">
            <h2 id="title">You Can Select Your Student's Grade In Here</h2><br/><br/><br/>
            <form action="view" method="post">
                <div class="col-sm-1"></div>
                <div class="col-sm-11">
                    <p class="col-sm-1 control-label input-lg">Name:</p>
                    <div class="col-sm-3"><input class="form-control input-lg" name="name" ></div>
                    
                    <p class="col-sm-2 control-label input-lg">Subject:</p>
                    <div class="col-sm-3">
                        <select class="form-control input-lg" name="select">
                            <c:forEach var="question" items="${result}">
                            <option><c:out value="${question.subject}"></c:out></option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-sm-3">
                        <input type="submit"class="btn btn-success btn-lg" value="Choose">
                        <a href="index.jsp" class="btn btn-primary btn-lg" role="button">Return</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div><br/><br/><br/><br/>
</div>

    <hr>

    <footer>
        <p style="text-align: center">&copy; Bingo 1414080902108</p>
    </footer>
</div> <!-- /container -->
  </body>
</html>
