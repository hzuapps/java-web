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
 <%request.setCharacterEncoding("utf-8");%>
 <center>
 <div class="container">
 <table class="table">
 <tbody>
 <tr>
 <td><b>注册名称</b></td>
 <td><%=request.getParameter("registername")%></td>
 </tr>
 <tr>
 <td><b>登陆密码</b></td>
 <td><%=request.getParameter("pwd")%></td>
 </tr>
 <tr>
 <td><b>真实姓名</b></td>
 <td><%=request.getParameter("TrueName")%></td>
 </tr>
 <tr>
 <td><b>身份证号</b></td>
 <td><%=request.getParameter("PersonalCode")%></td>
 </tr>
 <tr>
 <td><b>性别</b></td>
<td>
 <%=request.getParameter("Sex")%>
 </td>
 </tr>
 <tr>
 <td><b>出生日期</b></td>
<td><%=request.getParameter("BirthDate")%></td>
 </tr>
 <tr>
 <td><b>联系电话</b></td>
<td><%=request.getParameter("HomeNum")%></td>
 </tr>
 <tr>
 <td><b></b>E-mail</td>
 <td><%=request.getParameter("Email")%></td>
 </tr>
 <tr>
 <td><b>系别</b></td>
 <td><%=request.getParameter("Department")%></td>
 </tr>
 </tbody>
 </table>
 </div>
 </center>
 </body>
 </html> 