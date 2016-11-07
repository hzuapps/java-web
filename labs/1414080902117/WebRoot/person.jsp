<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.util.*,JDBC_package.JDBC_package" errorPage="" %>
<%
request.setCharacterEncoding("UTF-8");
JDBC_package.getUrl("3306", "test", "root","");
String account = request.getParameter("account")/*JDBC_package.account*/;
String password = request.getParameter("password")/*JDBC_package.password*/;
String select_user =String.format("select * from user,imformation where user.account='%s' and password ='%s' and user.account = imformation.account",account,password);
String name = "";
String score = "";
try{
	JDBC_package.SqlConnection();
	JDBC_package.getstmt();
	JDBC_package.select_table(select_user);
	JDBC_package.user_get(account,password);
	try
	{
		while(JDBC_package.result.next())
		{
			name = JDBC_package.result.getString("name");
			score = JDBC_package.result.getString("score");
		}
		if(account != "")
		{
			out.println("<table align='left' width='800' height='20'>");
			out.println("<tr><td bgcolor='#FF6666'>昵称:"+name+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;积分:"+score+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
			out.println("<a href='personal.jsp' target='_bank'>个人简历</a>&nbsp;&nbsp;&nbsp;<a href='enter.jsp'>退出</a>");			
			out.println("</td></tr></table>");
		}
		else
		{
			out.println("<table></tr><td><span class='STYLE1'>账号或密码错误.&nbsp;&nbsp;&nbsp;&nbsp;<a href='enter.jsp'>返回</a></span></td></tr></table>");
		}
	}
	catch(Exception e)
	{
		
	}
}
catch(Exception e)
{
	out.println("连接失败.");
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<style type="text/css">
<!--
.STYLE1 {font-size: 15px}
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
</body>
</html>