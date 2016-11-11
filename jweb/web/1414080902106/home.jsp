<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 因为是实验，所以只能发一个帖子 -->
<html>
	<head>
		<title>欢迎<c:out value="${username}" />浏览帖子</title>
	    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
		<link rel='stylesheet' href='css/home.css'>
		<script type="text/javascript" src="http://cdn.bootcss.com/jquery/3.1.1/jquery.js"></script>
		<script type="text/javascript" src="js/home.js"></script>
	</head>
	<body>
		<p id="username" align="right">
			欢迎&nbsp;<strong><c:out value="${username}" /></strong>
			<br><a href="logout.jsp" >退出登录</a>
		</p>
		<form method="post" action="new_content.jsp">
			<input id="new-button" class="btn btn-sm btn-primary" type="submit" value="发帖">
		</form>
		<div id="mid-block" >
			<c:forEach items="${content}" var="current" varStatus="i" >
				<div onmousemove="beObvious(this)" onmouseout="beNormal(this)" >
					<p class="every-title" >
						<a href="display.jsp?index=${i.count - 1}" >${current.getTitle()}</a>
					</p>
				</div>
			</c:forEach>
		</div>
	</body>
</html>