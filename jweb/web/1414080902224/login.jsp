<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<title>用户登录</title>
</head>
<body>
	<form action="ServletLogin">
		<h2>登录</h2>
			账号<input type="text"  name="username"><br>
			密码&nbsp;<input type="password" name="password"><br>
			<input type="checkbox">记住密码&nbsp;&nbsp;
			<input type="submit" value="登录">
		<c:if test="${sessionScope.username=='admin' }"><br>
			<c:out value="${'欢迎登陆' }"></c:out>
		</c:if>
	</form>
</body>
</html>