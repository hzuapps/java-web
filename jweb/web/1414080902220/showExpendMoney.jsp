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
    
    <title>月花费情况</title>
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
  					<caption>支出费用明细</caption>
 					<thead>
						<tr>
							<th>序号</th>
							<th>金额</th>
							<th>时间</th>
							<th>用途</th>
							<th>去向</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="expend" items="${expends}">
							<tr>
							<td><c:out value="${expend.id}"></c:out></td>
							<td><c:out value="${expend.number}" ></c:out></td>
							<td><c:out value="${expend.expendTime}" ></c:out></td>
							<td><c:out value="${expend.flowing}" ></c:out></td>
							<td>
							<c:if test="${ expend.purpose ne '未知'}"> 
								${expend.purpose }
							</c:if>
							</td>
							</tr>
						</c:forEach>
					</tbody>
  				</table>
  			</div>
  			<div class="col-xs-6 col-md-4"></div>
		</div>
  </body>
</html>
