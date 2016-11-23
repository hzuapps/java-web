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
<title>查询界面</title>
<style type="text/css">
.onediv {
	width: 390px;
	height: 250px;
	float: left;
	margin: 0 0 0 5px
}
</style>
</head>
<body>
     <div class="onediv">
		<form action="FindServlet" method="post">
     <h2>查询页面</h2>
			请输入学号：<input type="text" name="sno"><br> <input
				type="submit" value="提交"><br>
	</form>
	</div>
</body>
</html>
