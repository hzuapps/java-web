
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="mpq.css"/>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<title>登录</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>
<center>
<h1><%=new java.util.Date()%></h1>
</center>
	<div id="main_special">
		<fieldset><legend>登录</legend>
			<form action="/edu/hzu/javaweb/labs/se1406070302213/Se1406070302213Servlet.java" method="get">
				<label for="label1">用&nbsp; 户&nbsp; 名：</label>
				<input type="text" name="name" id="username label1"/><font style="font-size:12px;color:#898983"> *用户名不得超过16位字符</font><br>
				<label for="label2">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</label>
				<input type="password" name="pw" id="password label2"/><font style="font-size:12px;color:#898983"> *密码不能超过16位字符</font><br>
				<input type="submit" name="submit" class="submit" value="登录"/>
				<input type="reset" name="reset" class="submit" value="重置"/>
			</form>
		</fieldset>
		<c:if test="${sessionScope.pw != null}">
			<c:forEach items="${requestScope.userinfos}" var="userinfo">
				用户评价信息：
				${userinfo. id}
				${userinfo. name}
				${userinfo. age}
				${userinfo. sex}
				${userinfo. info}
			</c:forEach>
		</c:if>
	</div>
</body>
</html>