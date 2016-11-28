<%@ page language="java" import="java.util.*,bean.JDBC,java.sql.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

//String id = request.getParameter("id");

JDBC jdbc = new JDBC();		//实例化对象
try{
	jdbc.getConnection();  
	
	ResultSet Rs =jdbc.setQuery("select * from yonghu");
	out.println("连接成功<br>");
	out.println("<table border='1'><tr>");
    out.println("<td>name</td>");
    out.println("<td>id</td>");
    out.println("<td>roomnumber</td>");
    out.println("<td>telephone</td>");
    out.println("<td>assumption</td>");
    out.println("</tr>");
	while(Rs.next())
	{  
	    String name = Rs.getString("name");
		String id = Rs.getString("id");
		String roomnumber = Rs.getString("roomnuber");
		String telephone = Rs.getString("telephone");
		String assumption = Rs.getString("assumption");
		out.println("<tr>");
       	out.println("<td>"+name+"</td>");
       	out.println("<td>"+id+"</td>");
       	out.println("<td>"+roomnumber+"</td>");
       	out.println("<td>"+telephone+"</td>");
       	out.println("<td>"+assumption+"</td>");
		out.println("</tr>");
	}
		out.println("</table>");
	//jdbc.setUpdate("insert into yonghu(name,id,roomnuber,telephone,assumption) values('li','43353','301','123456','200')");

	

}
catch(Exception e)
{
	out.println("连接失败");
}

%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
    
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
   <a href="index.jsp"> 添加，查询，删除功能</a></br></br>
 
  </body>
</html>
