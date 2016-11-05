<jsp:useBean id="user" class="edu.hzu.javaweb.bean.UserData"
	scope="session" />
	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
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
 <meta charset = "utf-8">
 <body>

 <center>
 <div class="container">
 <table class="table">
 <tbody>
 <tr>
 <td><b>注册名称</b></td>
 <td><%= user.getReistername() %></td>
 </tr>
 <tr>
 <td><b>登陆密码</b></td>
 <td><%= user.getPwd() %></td>
 </tr>
 <tr>
 <td><b>真实姓名</b></td>
 <td><%=user.getTruename()%></td>
 </tr>
 <tr>
 <td><b>身份证号</b></td>
 <td><%=user.getPersonalCode()%></td>
 </tr>
 <tr>
 <td><b>性别</b></td>
<td>
 <%=user.getSex()%>
 </td>
 </tr>
 <tr>
 <td><b>出生日期</b></td>
<td><%=user.getBirthDate()%></td>
 </tr>
 <tr>
 <td><b>联系电话</b></td>
<td><%=user.getHomeNum()%></td>
 </tr>
 <tr>
 <td><b></b>E-mail</td>
 <td><%=user.getEmail()%></td>
 </tr>
 <tr>
 <td><b>系别</b></td>
 <td><%=user.getDepartment()%></td>
 </tr>
 </tbody>
 </table>
 </div>
 </center>
 </body>
 </html> 