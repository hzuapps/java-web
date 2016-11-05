<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet"
	href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">
<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
</head>
<script type="text/javascript">
	window.onload = function() {
		var btn = document.getElementById("btn1");
		btn.onclick = function() {
			window.location.href="<%=request.getContextPath()%>/1414080902119?operate=show";
		};
	};
</script>
<body>
	<div style="width: 380px; margin: 0 auto; margin-top: 50px;" id="main"
		align="center">
		<div class="btn-group btn-group-justified">
			<div class="btn-group">
				<button id="btn1" type="button" class="btn1 btn btn-default button">
					<c:out value="查看图书类别"></c:out>
				</button>
			</div>
		</div>
		<div class="hehe"
			style="width: 380px; height: 200px; border: 1px solid #000; border-radius: 5px">
			<div class="list-group" id="top">
				<c:forEach  varStatus="status" var="item" items="${requestScope.list }">
					<a href="#" class="list-group-item"><c:out value="${item.name }"></c:out></a>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>