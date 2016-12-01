<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="UTF-8">
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <title>登录界面</title>
</head>

<body>
<p></p>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div class="text-center"><font size="5"face="微软雅黑">填写登录信息</font></div>
<div>&nbsp;</div>
<p></p>
<form name="form1" action="1414080902217" onSubmit="return checksubmit();" method="post" class="form-horizontal" >
	<div class="form-group">
    <label for="inputEmail3" class="col-xs-4 control-label">账号:</label>
    <div class="col-xs-4">
    	<c:if test = "${userName != null }">
      	<input type="text" class="form-control" name="username" value="${userName}" >
      	</c:if>
      	<c:if test = "${userName == null }">
      	<input type="text" class="form-control" name="username" placeholder="账号" >
      	</c:if>
    </div>
    <div class="col-xs-2"><a class="btn btn-default" href="select.jsp" role="button">游客登录</a></div>
  	</div>
	
	<div class="form-group">
    <label for="inputEmail3" class="col-xs-4 control-label">密码:</label>
    <div class="col-xs-4">
      	<input type="password" class="form-control" name="userpwd" placeholder="密码">
    </div>
    <div class="col-xs-1"><a class="btn btn-default" href="registered.jsp" role="button">注册</a></div>
  	</div>
  	
	<div class="form-group">
    <div class="row">
      <div class="col-md-offset-5 col-xs-1"><button type="submit" class="btn btn-default">登录</button></div>
      <div class="col-xs-1"><button type="reset" class="btn btn-default">取消</button></div>
    </div>
  	</div>
</form>

<c:if test = "${userName != null }">
<script type="text/javascript">
 	alert("账号或密码错误！");
</script>
</c:if>
    	
<script type="text/javascript">
function checksubmit()
{
  if (document.form1.username.value == "")
        {
           alert("账号不能为空！");
           return false;
        } 
        else if(document.form1.userpwd.value == "")
        {
        	alert("密码不能为空！");
           return false;
        }
}
</script>
       
</body>
</html>