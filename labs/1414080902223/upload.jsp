<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<meta charset="UTF-8">
  	<title>学生成绩查询登陆</title>
	 <!-- 新 Bootstrap 核心 CSS 文件 -->
     <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
 
     <!-- 可选的Bootstrap主题文件（一般不用引入） -->
     <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">
 
     <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
     <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
 
     <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
     <script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
     
  </head>
  
  <body>
  	<center>
	<font color=red size=5><b>
	<i>请输入你的学号和密码</b></i>
	</font>
	<hr>
	<form action="result.jsp" method="post">
	<table border="1">
	<tr><th bgcolor="MintCream">学号</th><td>
	<input type="text" size=10 name="number"></td></tr>
	<tr><th bgcolor="MintCream">密码</th><td>
	<input type="password" size=10 name="password"></td></tr>
	<tr><td colspan="2" align="center">
	<input type="submit" vaule="查询"></td></tr>
	</table>
	</form>
	<font color="red">
	<%
	String error=request.getParameter("errortype");
	if(error!=null)
	{
	int errortype;
	errortype=Integer.parseInt(error);
	switch(errortype)
	{
	case 1:out.println("请输入学号!");break;
	case 2:out.println("请输入密码!");break;
	case 3:out.println("搞错,没有此人!");break;
	case 4:out.println("密码错误!");break;
	default:
	}
	}
	%>
	</font>
  </body>
</html>
