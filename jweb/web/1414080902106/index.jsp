<%@ page pageEncoding = "utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<title>登录页面</title>
		<meta content="charset=utf-8">
	</head>
	<body>
		<c:choose>
			<c:when test="${empty first}">
				<% session.setAttribute("first", "no"); %>
			</c:when>
			<c:when test="${not empty first}">
				<p align="center" style="color:red">
					<c:out value="用户名或密码输入错误！" />
				</p>
			</c:when>
		</c:choose>
		<form action="login" method="post">
			<table align="center">
				<tr>
					<td>用户名：</td>
					<td><input name="username" type="text"></td>
				</tr>
				<tr>
					<td align="right">密码：</td>
					<td><input name="password" type="password"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="登录"></td>
				</tr>
			</table>
		</form>
	</body>
</html>