<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
<link rel="stylesheet" href="css/shop_manager.css">
<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>

<title>商品信息</title>

</head>
<body>
	<table border="1">
		<tr>
			<th>名称</th>
			<th>编号</th>
			<th>价格</th>
			<th>描述</th>
			<th>数量</th>
			<th>品牌</th>
		</tr>
		<c:forEach var="mess" items="${mess}">
			<tr>
				<td class="name">
				<c:out value="${mess.shop_name}"></c:out>
				</td>
				<td class="id">
				<c:out value="${mess.shop_id}"></c:out>
				</td>
				<td class="price">
				<c:out value="${mess.price}"></c:out>
				</td>
				<td class="descript">
				<c:out value="${mess.descript}"></c:out>
				</td>
				<td class="num">
				<c:out value="${mess.num}"></c:out>
				</td>
				<td class="brand">
				<c:out value="${mess.brand}"></c:out>
				</td>
			</tr>
		</c:forEach>
    </table>
</body>
</html>