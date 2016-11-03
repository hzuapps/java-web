<%@ page language="java" import="java.util.*,java.sql.*,JDBC_package.JDBC_package" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String account = request.getParameter("account");
String password = request.getParameter("password");
String name = "";
String companyname = "";
String score = "";
String select_account=String.format("select * from user where account ='%s' and password = '%s'",account,password);
JDBC_package.getUrl("3306","test","root","");
try
{
	JDBC_package.SqlConnection();
	JDBC_package.getstmt();
	JDBC_package.select_table(select_account);
	try
	{
		while(JDBC_package.result.next())
		{
			name = JDBC_package.result.getString("name");
			companyname = JDBC_package.result.getString("companyname");
		}
		if(name != "" && companyname!="")
		{
			out.println("<h4 align='center'>登录成功!</h4><hr width='220'/>");
			out.println("<h3 align='center'><pre>");
			out.println(companyname+"公司的"+name+"，");
			out.println("欢迎您访问学院交流网");
			out.println("<h3 align='center'><a href='success.jsp'>转到个人中心</a></h3>");
			out.println("");
			out.println("</pre></h3>");
		}
		else
		{
			out.println("<h4 align='center'>登录失败！</h4>");
			out.println("<hr width='220'/><h3 align='center'>账号或者密码错误</h3>");
			out.println("<h3 align='center'><a href='index.jsp'>回到登录界面</a></h3>");
		}
	}
	catch(Exception e)
	{
		
	}
	
}
catch(Exception e)
{
	out.println("<h3 align='center'><a href='index.jsp'>登录失败</a></h3>");
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>跳转界面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  </body>
</html>
