<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<title>My JSP 'output.jsp' starting page</title>

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



<c:if test="${d==1}" > 欢迎同学:<br>
<c:out value="${stuname}"></c:out>你下的订单是：<td>
<c:out value="${expressname}"></c:out>的快递<td>
送到<c:out value="${stuadd}"></c:out><td>
手机号码是<c:out value="${stuphone}"></c:out>
</c:if>

<c:if test="${d==2}" > 欢迎同学:<br>
<c:out value="${stuname}"></c:out>你下的订单是：<td>
要寄<c:out value="${expressname}"></c:out>的快递<td>
到<c:out value="${stuadd}"></c:out><td>收件
手机号码是<c:out value="${stuphone}"></c:out>
</c:if>

<p>现在的时间是:<%=new Date() %></p>

<form action="web/insert.jsp" method="post">
<table>
<tr><td> <input type="hidden"name="stuname" value="${stuname}"></td></tr>
<tr><td><input type="hidden"name="stuphone"maxlength=11 value="${stuphone}"></td></tr>
<tr><td><input type="hidden"name="expressname" value="${expressname}"></td></tr>
<tr><td><input type="hidden"name="stuadd" value="${stuadd}"></td></tr>
<input type="submit" value="提交">&nbsp;&nbsp;&nbsp;
<input type="reset" value="取消">
</table>

</form>



</body>
</html>
