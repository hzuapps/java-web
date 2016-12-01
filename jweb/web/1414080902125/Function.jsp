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

<form>
	<table align="center">
	    <tr>
	       <td align="left">     
	       亲爱的<c:out value="${ param.id}"></c:out>用户！
	       </td>
	    </tr>
	    
		<tr>
			<td align="left">功能选择：</td>
		</tr>
		
		<tr>
			<td align="right">
				<input type="button" name="" value="提交作业" onclick="window.location.href='Submit.jsp'">
			</td>
		</tr>
		
		<tr>
			<td align="right">
				<input type="button" name="" value="查看作业" onclick="window.location.href='Look.jsp'">
			</td>
		</tr>
		
		<%
		String str1=request.getParameter("id");
        session.setAttribute( "str",str1);
		 %>
	</table>
</form>

</html>
