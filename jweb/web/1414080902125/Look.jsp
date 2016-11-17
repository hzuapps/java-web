<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>查看作业</title>
</head>
<body>

<form>
	<table align="center">
		<tr>
			<td align="left" >查看作业：</td>
		</tr>
		<tr>
			<td align="left">
				在这里显示作业：
			</td>
		</tr>
		
		<tr>
		   <td align="left">
		      <%
		      request.setCharacterEncoding("UTF-8");
		      %>
		      <%
				String job1;
				String str1=request.getParameter("JOB1");
				request.setAttribute("job1", str1);
		        request.getAttribute("job1");
		       %>
		      <c:out value="${requestScope.job1}"></c:out>
		   </td>
		</tr>
		
		<tr>
		   <td align="left">
		   <%
		   request.setCharacterEncoding("UTF-8");
		    %>
		      <c:out value="${param.JOB1}"></c:out>
		   </td>
		</tr>
		
	</table>
</form>

</body>
</html>