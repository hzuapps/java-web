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

<form action="CKjieguo.jsp" method="post">
	<table align="center">
	    <tr>
	         <td>请输入学号：</td>
	    </tr>
	    
		<tr>
              </td><td><input type="text" name="id"></td>
        </tr>
        
        <tr>
			<td align="right">
				<input type="submit" name="" value="查看">
				<input type="reset" name="" value="取消">
			</td>
		</tr>
	</table>
</form>

</body>
</html>