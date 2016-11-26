<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>查看发布的交易</title>
</head>
<body>

<form>
	<table align="center">
		<tr>
			<td align="left" >查看交易：</td>
		</tr>
	
		
		<tr>
		   <td align="left">
		      <%
		      request.setCharacterEncoding("UTF-8");
		      %>
		      <%
				String str1=request.getParameter("Email");
				String str2=request.getParameter("Name");
				String str3=request.getParameter("ID");
				String str4=request.getParameter("PW");
				String str5=request.getParameter("Select");
				String str6=request.getParameter("Money");
				request.setAttribute("Email1", str1);
		        	request.setAttribute("Name",str2);
		        	request.setAttribute("ID",str3);
		        	request.setAttribute("PW",str4);
		        	request.setAttribute("Select",str5);
		        	request.setAttribute("Money",str6);
		       %>
		     
		     <sapn>邮箱:<c:out value="${requestScope.Email1}"></c:out></sapn></br>
		     <span>姓名：<c:out value="${requestScope.Name}"></c:out></span></br>
		     <span>身份证：<c:out value="${requestScope.ID}"></c:out></span></br>
		      <span>密码：<c:out value="${requestScope.PW}"></c:out></span></br>
		      <span>游戏类型：<c:out value="${requestScope.Select}"></c:out></span></br>
		      <span>价格：<c:out value="${requestScope.Money}"></c:out></span> </br>
		   </td>
		</tr>


		
	</table>
</form>

</body>
</html>