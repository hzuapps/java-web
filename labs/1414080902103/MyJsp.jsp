<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page import="java.sql.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>学生签到登记表1</title>


<script Language="JavaScript" src="index.js"> </script> 


<link rel="stylesheet"
	href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

</head>


<body>

	<form id="stu" action="1414080902103" method="post" target="right" >

		<div>
			姓名：<input type="text" name="name" id="name">
		</div>
		<div>
			学号：<input type="text" name="id" id="id">
		</div>
		<div>
			日期：<input type="text" name="date" id="date">
		</div>
		<div>缺勤情况：</div>
		<div>
			<textarea  rows="5" cols="50" name="note" id="note"></textarea>
		</div>

		<div>

		
    <button type="submit" >登记</button>
    
	
			
			<input type="reset" value="取消" >
		</div>	  
	</form>
	<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
	<script
		src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>


</body>
</html>
