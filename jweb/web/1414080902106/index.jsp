<%@ page pageEncoding = "utf-8" %>
<html>
	<head>
		<title>登录页面</title>
		<meta content="charset=utf-8">
	</head>
	<body>
		<p align="center" style="color:red">
		<%
			String first = (String)session.getAttribute("first");
			if(first == null)
				session.setAttribute("first", "no");
			else
				out.println("用户名或密码输入错误！");
		%>
		</p>
		<form action="login" method="post">
			<table align="center">
				<tr>
					<td>用户名：</td>
					<td><input name="username" type="text"></td>
				</tr>
				<tr>
					<td align="right">密码：</td>
					<td><input name="password" type="password"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="登录"></td>
				</tr>
			</table>
		</form>
	</body>
</html>