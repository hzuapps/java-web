<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.util.*,JDBC_package.JDBC_package" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录</title>
<style type="text/css">
<!--
.STYLE1 {font-size: 10px}
-->
</style>
</head>
<style type="text/css">
body
{
	padding:  0px;
	margin: 0px;
}
div
{
	align : center;
}
a
{
	text-decoration: none;
}
</style>
<body>
<form name="form_enter" id="form_enter" method="post">
<table align="left" width="800" height="30"> 
				<tr>
					<td bgcolor="#FF6666">
					  <span class="STYLE1">账号:</span>
					  <input type="text" name="account" id="account" width="80" height="10">
					  <span class="STYLE1">密码:</span>
					  <input type="password" name="password" id="password" width="80" height="10">&nbsp;
					<input type="submit" name="enter" id="enter" value="登录" onclick="f_enter()" />
				  	<input type="button" name="register" id="register" value="注册" onclick="f_register()"/>&nbsp;&nbsp;&nbsp;
				  <input type="text" name="text_find" id="text_find" width="100"/>&nbsp;<input type="button" id="button_find" name="button_find" value="搜索" height="10"/>
			  </td>
				</tr>
			</table>
			</form>
</body>
</html>
<script type="text/javascript" src="http://cdn.bootcss.com/jquery/3.1.1/jquery.js"></script>
<script type="text/javascript">
	function f_enter()
	{
		if(form_enter.account.value == "")
		{
			alert("请输入账号.");
		}
		else if(form_enter.password.value == "")
		{
			alert("请输入密码.");
		}
		else
		{
			form_enter.action="person.jsp";
			form.submit();
		}
	}
	function f_register()
	{
			window.open("register.jsp");
	}
</script>