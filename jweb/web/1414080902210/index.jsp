<jsp:useBean id="user" class="edu.hzu.javaweb.bean.UserData"
	scope="session" />
<jsp:setProperty name="user" property="*" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">

<!-- 可选的Bootstrap主题文件（一般不用引入） -->
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<meta charset = "utf-8">
<head>
    <title>学生信息登记表</title>
</head>
<script language="JavaScript">
function checkit(){
    var theForm;
    theForm=document.stuForm;
    if(theForm.registername.value==""){
    alert("请输入学生注册名！");
    document.stuForm.registername.focus();
    return false;
    }
    if(theForm.TrueName.value==""){
    alert("请输入学生真实姓名！");
    theForm.TrueName.focus();
    return false;
    }
    if(theForm.PersonalCode.value==""){
    alert("身份证号码不能为空！");
    theForm.PersonalCode.focus();
    return false;
    }
    if(theForm.pwd.value==""){
    alert("密码不能为空！");
    theForm.pwd.focus();
    return false;
    }

    if(theForm.BirthDate.value==""){
    alert("请选择出生日期！");
    theForm.BirthDate.focus();
    return false;
    }
    if(theForm.HomeNum.value==""){
    alert("电话号码不能为空！");
    theForm.HomeNum.focus();
    return false;
    }
    if(theForm.Email.value==""){
    alert("Email不能为空！");
    theForm.Email.focus();
    return false;
    }
    if(theForm.Department.value==""){
    alert("请选择您的系别！");
    theForm.Department.focus();
    return false;
    }
   theForm.submit();
}
</script>
<body>

<h1 class="text-center">学生信息登记表</h1>
<hr>
<form class="form-horizontal" name="stuForm" action="showinfo.jsp" method="post" role= "form">
	<div class="form-group">
		<label class="col-sm-2 control-label" for="RegisterName">注册名称</label>
		<div class="col-sm-10">
		<input type="text" name="registername" class="form-control" id="RegisterName" placeholder="请输入注册名称">
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-2 control-label" for="Password1">密码</label>
		<div class="col-sm-10">
		<input type="password" name="pwd"  class="form-control" id="Password1" placeholder="请输入六位以上密码">
		</div>
	</div>

	<div class="form-group">
		<label class="col-sm-2 control-label" for="truename">真实姓名</label>
		<div class="col-sm-10">	
		<input type="text" name="TrueName" class="form-control"  id="truename"  placeholder="请再输入您的真实姓名"/>
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-2 control-label" for="personalcode">身份证号码</label>
		<div class="col-sm-10">	
		<input type="text" name="PersonalCode" class="form-control" id="personalcode" placeholder="请再输入您的身份证号码">
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-2 control-label" for="Radio">性别   </label>
		<div class="radio">	
		<div class="col-sm-5"><input type="radio" value="男" name="Sex" id="Sex1" checked >男</div>
		<div class="col-sm-5"><input type="radio" value="女" name="Sex" >女</div>
	</div>
	</div>

<div class="form-group">
	<label class="col-sm-2 control-label">出生日期</label>
	<div class="col-sm-10">
	<select name="BirthDate" class="form-control">
	<option checked value=""></option>
	<option value="1952">2000</option>
	<option value="1953">1999</option>
	<option value="1954">1998</option>
	<option value="1955">1997</option>
	<option value="1956">1996</option>
	<option value="1957">1995</option>
	<option value="1958">1994</option>
	<option value="1959">1993</option>
	<option value="1960">1992</option>
	<option value="1961">1991</option>
	<option value="1962">1990</option>
	<option value="1963">1989</option>
	<option value="1964">1988</option>
	</select>
	</div>
</div>
<div class="form-group">
	<label class="col-sm-2 control-label" for="homenum">联系电话</label>
	<div class="col-sm-10">
	<input type="text" name="HomeNum" class="form-control" id="homenum" placeholder="请再输入您的联系电话">
	</div>
</div>
<div class="form-group">
	<label class="col-sm-2 control-label" for="email">E-mail</label>
	<div class="col-sm-10">
	<input type="text" name="Email" class="form-control" id="email" placeholder="请再输入您的邮箱地址">
	</div>
</div>
<div class="form-group">
	<label class="col-sm-2 control-label" for="department">系别</label>
	<div class="col-sm-10">	
	<select name="Department" class="form-control">
	<option checked value=""></option>
	<option value="计算机科学系">计算机科学系</option>
	<option value="数学系">数学系</option>
	<option value="建土系">建土系</option>
	<option value="服装系">服装系</option>
	<option value="旅游系">旅游系</option>
	<option value="中文系">中文系</option>
	<option value="体育系">体育系</option>
	<option value="美术系">美术系</option>
	</div>
	</select>
</div>
<p align="center" >
<button type="submit" value="提交 " name="Submit" class="btn btn-default" onclick="checkit()">提交</button>
<button type="reset" value="重填" name="Submit2" class="btn btn-default">重填</button>
</p>
</form>
</body>
</html>