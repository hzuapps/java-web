

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

<title>My JSP 'find_stu_1.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
	<center>
		 根据学号查询<font size="5" color="red"></font>
		<table border="2" bgcolor="ccceee" width="650">
			<tr bgcolor="CCCCCC" align="center">
				<td>学号</td>
				<td>姓名</td>
				<td>性别</td>
				<td>年龄</td>
				<td>体重</td>
				<td>身高</td>
				<td>长跑</td>
				<td>短跑</td>
				<td>肺活量</td>
			</tr>


			<tr align="center">
				<td><%=request.getAttribute("sno")%></td>
				<td><%=request.getAttribute("name")%></td>
				<td><%=request.getAttribute("sex")%></td>
				<td><%=request.getAttribute("age")%></td>
				<td><%=request.getAttribute("weight")%></td>
				<td><%=request.getAttribute("hight")%></td>
				<td><%=request.getAttribute("longRun")%></td>
				<td><%=request.getAttribute("shortRun")%></td>
				<td><%=request.getAttribute("pulmonary")%></td>
			</tr>

		</table>
	</center>

</body>
</html>


