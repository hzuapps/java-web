<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Upload.jsp' starting page</title>
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	h1{color:red;text-decoration:underline;font-weight:bold;font-size:25px;}
	h2{font-size:20px;color:blue;}
 	</style>
  </head>
  
  <body>
	<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
	<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
  <form action="Se1414080902203Servlet" method="post">
	<div id="01" style=" position:absolute; width:100%; height:100%; background-color:yellow"
	<center> 现在的时间是： <%=new Date()%> ：60S后刷新<hr>
	<%response.setHeader("refresh","60");%>
	</center>
	</div>
	<div id="02" style=" position:absolute; width:100%; height:100%; background-color:#33CC99">
  	<table border="0" align="center" width=400>
  	<tr><td align="center"><h1>Hello Teacher</h1></td></tr>
	
    <tr><td colspan="2" ><h2>选择文件：*</h2><input type="file" accept="video/mp4" multiple="multiple" >
	请输入验证码（Upload）:<input type="text" name="Pass"><br>
	<input type="submit" value="提交"><br>
	<input type="reset"></td>
	
	</tr>
  	</table>
	</div>
  </form>
  
  </body>
</html>