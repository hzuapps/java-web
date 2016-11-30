<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'showall.jsp' starting page</title>
  </head>
  
  <body>
  <center>
    <%
    	String driveName ="com.mysql.jdbc.Driver";
    	String url1="jdbc:mysql://localhost:3306/web";
    	String url2="?user=root&password=";
    	String url3="&useUnicode=true&charsetEncoding=UTF-8";
    	String url=url1+url2+url3;
    	Class.forName("com.mysql.jdbc.Driver");
    	Connection conn=DriverManager.getConnection(url);
    	String sql="select * from user_information";
    	PreparedStatement pstmt=conn.prepareStatement(sql);
    	ResultSet rs=pstmt.executeQuery();
    	rs.last();
     %>你要查询的学生数据表中共有
     	<font size="5" color="red"><%=rs.getRow() %></font>人
     	<table border="2" bgcolor="ccceee" width="650">
     		<tr bgcolor="CCCCCC" align="center">
     			<td>记录条数</td><td>账号</td><td>密码</td>
     			<td>性别</td>
     		</tr>
     	<%rs.beforeFirst();
     		while(rs.next()){
     	 %>	<tr align="center">
     	 		<td><%=rs.getRow() %></td>
     	 		<td><%=rs.getString("username") %></td>
     	 		<td><%=rs.getString("userpwd") %></td>
     	 		<td><%=rs.getString("sex") %></td>
     	 	</tr>
     	 <%} %>
     	 </table>
     	</center>
     	<%
     		if(rs!=null){rs.close();}
     		if(pstmt!=null){pstmt.close();}
     		if(conn!=null){conn.close();}
     	 %>
  </body>
</html>
