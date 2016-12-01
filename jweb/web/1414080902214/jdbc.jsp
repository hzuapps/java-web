<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 <%@ page import="java.io.*,java.util.*,java.sql.*"%>
 <%
 String path = request.getContextPath();
 String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
 %>
 <html>
 	<head>
 		<title>租车</title>
 	</head>
 	<body>
 		<%
 			String driveName = "com.mysql.jdbc.Drive";
 			String userName = "root";
 			String userPwd = "123456";
 			String dbName = "car";
 			String url1 = "jdbc:mysql://localhost:3306/car";
 			String url2 = "?user=root&password=123456";
 			String url3 = "&useUnicode=true&characterEncoding=UTF-8";
 			String url = url1+url2+url3;
 			Class.forName("com.mysql.jdbc.Driver");
 			Connection conn = DriverManager.getConnection(url);
 			String sql = "select *from cars";
 			PreparedStatement pstmt = conn.prepareStatement(sql);
 			ResultSet rs = pstmt.executeQuery();
 			rs.last();
 		 %>
 		 <p size="5" color="red" align="center">仓库现在的车有<%=rs.getRow() %>条</p>
 		 <table border="2" bgcolor="ccceee" width="650" align="center">
 		 	<tr bgcolor="CCCCCC" align="center">
 		 		<td>编号</td><td>车名</td>
 		 	</tr>
 		 	<%rs.beforeFirst();
 		 		while(rs.next()){
 		 	 %><tr align="center">
 		 	 <td><%=rs.getString("carid") %></td>
 		 	 <td><%=rs.getString("carname") %></td>
 		 	 
 	 	 </tr>
 		 	 <%} %>
 		 </table>
 		 <%if(rs!=null){rs.close();} 
 		 	if(pstmt!=null){pstmt.close();}
 		 	if(conn!=null){conn.close();}
 		 %>
 	</body>
 </html> 