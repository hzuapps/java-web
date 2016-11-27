<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 <%@ page import="java.io.*,java.util.*,java.sql.*"%>
 <%
 String path = request.getContextPath();
 String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
 %>
 <html>
 	<head>
 		<title>department introduction</title>
 	</head>
 	<body>
 		<%
 			String driveName = "com.mysql.jdbc.Drive";
 			String userName = "root";
 			String userPwd = "123";
 			String dbName = "dtable";
 			String url1 = "jdbc:mysql://localhost:3306/dtable";
 			String url2 = "?user=root&password=123";
 			String url3 = "&useUnicode=true&characterEncoding=UTF8";
 			String url = url1+url2+url3;
 			Class.forName("com.mysql.jdbc.Driver");
 			Connection conn = DriverManager.getConnection(url);
 			String sql = "select *from dlist";
 			PreparedStatement pstmt = conn.prepareStatement(sql);
 			ResultSet rs = pstmt.executeQuery();
 			rs.last();
 		 %>
 		 <p size="5" color="red" align="center">部门职能介绍</p>
 		 <table border="2" bgcolor="ccceee" width="650" align="center">
 		 	<tr bgcolor="CCCCCC" align="center">
 		 		<td>编号</td><td>部门</td><td>职能介绍</td>
 		 	</tr>
 		 	<%rs.beforeFirst();
 		 		while(rs.next()){
 		 	 %><tr align="center">
 		 	 <td><%=rs.getString("id") %></td>
 		 	 <td><%=rs.getString("name") %></td>
 		 	 <td><%=rs.getString("introd") %></td>
 		 	 </tr>
 		 	 <%} %>
 		 </table>
 		 <%if(rs!=null){rs.close();} 
 		 	if(pstmt!=null){pstmt.close();}
 		 	if(conn!=null){conn.close();}
 		 %>
 	</body>
 </html> 