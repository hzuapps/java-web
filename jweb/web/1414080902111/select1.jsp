<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>功能选择</title>
</head>
<body>

<%
    String name;
    String str1=request.getParameter("NAME");
    request.setAttribute("name",str1) ;
    request.getAttribute("name");
 %>

 <c:if test="${empty requestScope.name}">
     <%
     response.sendRedirect("Fail.jsp");
      %>
 </c:if>

<form>
	<table align="center">
	    <tr>
	       <td align="left">     
	       <c:out value="${ param.NAME}"></c:out>您好！
	       </td>
	    </tr>
	    
		<tr>
			<td align="left">请选择：</td>
		</tr>
		<tr>
			<td align="right">
				<input type="button" name="" value="发布交易" onclick="window.location.href='tijiao.jsp'">
			</td>
		</tr>
		<tr>
			<td align="right">
				<input type="button" name="" value="查看交易" onclick="window.location.href='chakan.jsp'">
			</td>
		</tr>
	</table>
</form>

</html>