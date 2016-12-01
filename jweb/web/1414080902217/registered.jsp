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
    <title>注册界面</title>
</head>

<body>
<p></p>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div class="text-center"><font size="5"face="微软雅黑">填写注册信息</font></div>
<div>&nbsp;</div>
<p></p>
<p></p>
<form action="register" method="post" class="form-horizontal" onSubmit="return checksubmit(this);" >
	<div class="form-group">
    <label for="inputEmail3" class="col-xs-4 control-label">账号:</label>
    <div class="col-xs-4">
      	<input type="text" class="form-control" name="username" placeholder="账号">
    </div>
    <p class="form-control-static"><font size="3"face="微软雅黑">(必填)</font></p>
  	</div>
	
	<div class="form-group">
    <label for="inputEmail3" class="col-xs-4 control-label">密码:</label>
    <div class="col-xs-4">
      	<input type="password" class="form-control" name="userpwd" placeholder="密码">
    </div>
    <p class="form-control-static"><font size="3"face="微软雅黑">(必填)</font></p>
  	</div>
  	
  	<div class="form-group">
    <label for="inputEmail3" class="col-xs-4 control-label">名称:</label>
    <div class="col-xs-4">
    	<c:if test = "${user != null }">
      	<input type="text" class="form-control" name="cname" value="${user.getcustomerName()}">
      	</c:if>
      	<c:if test = "${user == null }">
      	<input type="text" class="form-control" name="cname" placeholder="名称" >
      	</c:if>
    </div>
    <p class="form-control-static"><font size="3"face="微软雅黑">(必填)</font></p>
  	</div>
  	
  	<div class="form-group">
    <label for="inputEmail3" class="col-xs-4 control-label">收货地址:</label>
    <div class="col-xs-4">
    	<c:if test = "${user != null }">
      	<input type="text" class="form-control" name="useraddr" value="${user.getUseraddr()}">
      	</c:if>
      	<c:if test = "${user == null }">
      	<input type="text" class="form-control" name="useraddr" placeholder="收货地址" >
      	</c:if>
    </div>
    <p class="form-control-static"><font size="3"face="微软雅黑">(必填)</font></p>
  	</div>
  	
	<div class="form-group">
    <div class="row">
      <div class="col-xs-offset-5 col-xs-1"><button type="submit" class="btn btn-default">注册</button></div>
      <div class="col-xs-5"><a class="btn btn-default" href="index.jsp" role="button">返回</a></div>
    </div>
  	</div>
  	
</form>

<c:if test = "${user != null }">
<script type="text/javascript">
 	alert("用户名存在！");
</script>
</c:if>

<script type="text/javascript">
function checksubmit(obj)
{
  if (obj.username.value == "")
        {
           alert("账号不能为空！");
           return false;
        } 
        else if(obj.userpwd.value == "")
        {
        	alert("密码不能为空！");
           return false;
        }
        else if(obj.cname.value == "")
        {
        	alert("名称不能为空！");
           return false;
        }
        else if(obj.useraddr.value == "")
        {
        	alert("收货地址不能为空！");
           return false;
        }
}
</script>
       
</body>
</html>
