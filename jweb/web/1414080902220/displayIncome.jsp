<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>收入明细</title>
  	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	<style type="text/css">
		td,th{
			text-align:center;
		}
		
		body{
			background:#777;
		}
		
	</style>

  </head>
  
  <body>
    <div class="row">
  			<div class="col-xs-12 col-md-8">
  				<table class="table table-hover">
  					<caption>收入明细</caption>
 					<thead>
						<tr>
							<th>序号</th>
							<th>收入金额</th>
							<th>来源</th>
							<th>日期</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="income" items="${queryResult}">
							<tr>
							<td><c:out value="${income.id}"></c:out></td>
							<td><c:out value="${income.incomeMoney}" ></c:out></td>
							<td><c:out value="${income.description}" ></c:out></td>
							<td><c:out value="${income.time}" ></c:out></td>
							</tr>
						</c:forEach>
					</tbody>
  				</table>
  			</div>
  			<div class="col-xs-6 col-md-4"></div>
	</div>
  </body>
</html>
