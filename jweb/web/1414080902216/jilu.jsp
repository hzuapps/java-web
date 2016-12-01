<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
	<head>
		<title>聚会记录</title>
	</head>
	<body>
		<%
			String driveName = "com.mysql.jdbc.Drive";
			String userName = "root";
			String userPwd = "123456";
			String dbName = "meet";
			String url1 = "jdbc:mysql://localhost:3306/meet";
			String url2 = "?user=root&password=123456";
			String url3 = "&useUnicode=true&characterEncoding=UTF-8";
			String url = url1+url2+url3;
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(url);
			String sql = "select *from meets";
			PreparedStatement p = conn.prepareStatement(sql);
			ResultSet r = p.executeQuery();
			r.last();
		 %>
		 <p size="3" color="black" align="center">您现在的聚会有<%=r.getRow() %>个</p>
		 <table border="1" bgcolor="ccceee" width="500" align="center">
		 	<tr bgcolor="CCCCCC" align="center">
		 		<td>聚会</td><td>聚会时间</td><td>开始时间</td>
		 	</tr>
		 	<%r.beforeFirst();
		 		while(r.next()){
		 	 %><tr align="center">
		 	 <td><%=r.getString("miid") %></td>
		 	 <td><%=r.getString("malltime") %></td>
		 	 <td><%=r.getString("mstarttime") %></td>
		 	 </tr>
		 	 <%} %>
		 </table>
		 <%if(r!=null){r.close();} 
		 	if(p!=null){p.close();}
		 	if(conn!=null){conn.close();}
		 %>
	</body>
</html>