<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>提交作业</title>
</head>
<body>

<form action="TJjieguo.jsp" method="post">
	<table align="center">
		<tr>
			<td align="left" >提交作业：</td>
		</tr>
		
		<tr>
			<td>
				<textarea name="job" rows="10" cols="100" wrap="virtual">在这里编写作业</textarea>
			</td>
		</tr>
		
		<tr>
			<td align="right">
				<input type="submit" name="" value="提交">
				<input type="reset" name="" value="取消">
			</td>
		</tr>
	</table>
</form>

</body>
</html>
