<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "edu.hzu.javaweb.labs.se1414080902134.UserData" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	UserData ud = (UserData)application.getAttribute("UserData");
	if (ud != null) {
		out.write("Welcome , " + ud.getUserName());
	}
	%>
	<h1>Now here is nothing .</h1>
</body>
</html>