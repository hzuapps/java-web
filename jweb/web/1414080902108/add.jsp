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

<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>新增试题</title>
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">
    <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <!--<script src="js/bootstrap.min.js"></script>-->
    <!--<link type="text/css" href="css/style.css" rel="stylesheet">-->
    <!--<script src="JS/jquery-2.2.1.js"></script>-->
    <!--<script src="index.js"></script>-->
    <style>
        .navbar {
            min-height: 30px;
            margin-bottom: 0;
            border-radius: 0;
        }

        h4 {
            font-weight: bold;
            margin-left: 10px;
            margin-bottom: 20px;
        }

        footer p {
            font-weight: bold;
        }

        .control-label {
            text-align: left;
        !important;
        }

        input {
            margin-top: 2px;
        }

        select {
            margin-top: 2px;
        }

        h1 {
            text-align: center;
            margin-bottom: 30px;
        }

        .checkbox {
            float: left;
            margin-right: 20px;
        }

        #submit {
            margin-left: 20%;
        }

        * {
            font-family: "微软雅黑";
        }
        a{
            color:#FFFFFF;
            text-decoration: none;
        }
        a:HOVER {
            color:#FFFFFF;
	        text-decoration: none;
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
            <div class="col-md-3 ">
            </div>
            <div class="col-md-6 container">
                
                <div>
                    <h1>Add your question</h1>

                    <!--<h4>Add your question and answer</h4>-->
                </div>
                <form role="form" id="row" class="form-horizontal" method="post" action="Se1414080902108Servlet">
                    <div class="form-group">
                        <label for="inputSubject" class="col-sm-2 control-label">Subject</label>

                        <div class="col-sm-10">
                            <select class="form-control" name="subject">
                            <c:forEach var="question" items="${result}">
                            <option><c:out value="${question.subject}"></c:out></option>
                            </c:forEach>
                        </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputQuestion" class="col-sm-2 control-label">Question</label>

                        <div class="col-sm-10">
                            <textarea class="form-control" id="inputQuestion" name="question" placeholder="Enter Question"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputAnswer1" class="col-sm-2 control-label">Option A</label>

                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="inputAnswer1" name="answer1" placeholder="Enter Answer">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputAnswer2" class="col-sm-2 control-label">Option B</label>

                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="inputAnswer2" name="answer2" placeholder="Enter Answer">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputAnswer3" class="col-sm-2 control-label">Option C</label>

                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="inputAnswer3" name="answer3" placeholder="Enter Answer">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputAnswer4" class="col-sm-2 control-label">Option D</label>

                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="inputAnswer4" name="answer4" placeholder="Enter Answer">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputA" class="col-sm-2 control-label">Answer</label>

                        <div class="col-sm-10">
                            <div class="checkbox">
                                <label>
                                    <input type="radio" id="inputA" name="answer" onclick="check()" value="A"> A
                                </label>
                            </div>
                            <div class="checkbox">
                                <label>
                                    <input type="radio" id="inputB" name="answer" onclick="check()" value="B"> B
                                </label>
                            </div>
                            <div class="checkbox">
                                <label>
                                    <input type="radio" id="inputC" name="answer" onclick="check()" value="C"> C
                                </label>
                            </div>
                            <div class="checkbox">
                                <label>
                                    <input type="radio" id="inputD" name="answer" onclick="check()" value="D"> D
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="container">
                        <button type="submit" class="btn btn-success" id="submit" name="submit">Add</button>
                        <button type="reset" class="btn btn-primary" id="reset" name="reset">Reset</button>
                        <button type="button" class="btn btn-success" id="select" name="select"><a href="Se1414080902108Servlet">Select</a></button>
                    </div>
                </form>
                <hr/>
                <div class="">
                    <footer>
                        <p style="text-align: center">系统当前时间：<%= new Date().toLocaleString() %></p>
                        <p style="text-align: center">&copy;&nbsp;Bingo1414080902108</p>
                    </footer>
                </div>
            </div>
            <div class="col-md-3"></div>
        </div>
    </div>
</div>


<script>

    var checked = false;
    $(document).ready(function () {
        $("#row").submit(function (event) {
            var subject = $("#inputSubject").val();
            var question = $("#inputQuestion").val();
            var option1 = $("#inputAnswer1").val();
            var option2 = $("#inputAnswer2").val();
            var option3 = $("#inputAnswer3").val();
            var option4 = $("#inputAnswer4").val();
            var A = $("#inputA");
            var B = $("#inputB");
            var C = $("#inputC");
            var D = $("#inputD");
            
            
            if (subject == "") {
                event.preventDefault();
                alert("请输入科目！");              
            }
            else if (question == "") {
                event.preventDefault();
                alert("请输入题目！");
            }
            else if (option1 == "" || option2 == "" || option3 == "" || option4 == "") {
                event.preventDefault();
                alert("请输入选项！");
            }
            else if (!checked) {
                event.preventDefault();
                alert("请选择答案！");
            }
            else {
               /* alert("提交成功！"); */
                /* $.ajax({
                    url: "success.json"
                }).done(function (data) {
                    if (console && console.log) {
                        console.dir(data);
                        alert(data.msg);
                    }
                });  */
            }
        })

    });

    function check() {
        checked = true;
    }
</script>

</body>
</html>