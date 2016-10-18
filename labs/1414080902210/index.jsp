<%@ page language="java" contentType="text/html;charset=utf-8"%>
<%@ page import="java.util.*,java.io.*" %>
<html>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">

<!-- 可选的Bootstrap主题文件（一般不用引入） -->
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<head><title>学生信息登记表</title></head>
<body>
<!--对提交到该JSP页面含有中文的信息实现以中文正常显示-->
<%request.setCharacterEncoding("utf-8");%>
<center>
<div class="container">
<table class="table">
<tbody>
<tr>
<td><b>注册名称</b></td>
<!--从用户提交表单获取注册名称-->
<td><%=request.getParameter("registername")%></td>
</tr>
<tr>
<td><b>登陆密码</b></td>
<!--从用户提交表单获取登录密码-->
<td><%=request.getParameter("pwd")%></td>
</tr>
<tr>
<td><b>真实姓名</b></td>
<!--从用户提交表单获取真是姓名-->
<td><%=request.getParameter("TrueName")%></td>
</tr>
<tr>
<td><b>身份证号</b></td>
<!--从用户提交表单获取身份证号-->
<td><%=request.getParameter("PersonalCode")%></td>
</tr>
<tr>
<td><b>性别</b></td>
<!--从用户提交表单获取性别-->
<td>
<%=request.getParameter("Sex")%>
</td>
</tr>
<tr>
<td><b>出生日期</b></td>
<!--从用户提交表单获取出生日期-->
<td><%=request.getParameter("BirthDate")%></td>
</tr>
<tr>
<td><b>联系电话</b></td>
<!--从用户提交表单获取联系电话-->
<td><%=request.getParameter("HomeNum")%></td>
</tr>
<tr>
<td><b></b>E-mail</td>
<td><%=request.getParameter("Email")%></td>
</tr>
<tr>
<td><b>系别</b></td>
<!--从用户提交表单获取系别-->
<td><%=request.getParameter("Department")%></td>
</tr>
</tbody>
</table>
</div>
</center>
</body>
</html>