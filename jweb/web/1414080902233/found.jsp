<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
	<head>
		<title>附近路线</title>
	</head>
	<body>
		<%
			String driveName = "com.mysql.jdbc.Drive";
			String userName = "root";
			String userPwd = "qq1083688285";
			String dbName = "routequery";
			String url1 = "jdbc:mysql://localhost:3306/routequery";
			String url2 = "?user=root&password=qq1083688285";
			String url3 = "&useUnicode=true&characterEncoding=UTF-8";
			String url = url1+url2+url3;
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(url);
			String sql = "select *from route";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			rs.last();
		 %>
		 <p size="5" color="red" align="center">您附近的线路有<%=rs.getRow() %>条</p>
		 <table border="2" bgcolor="ccceee" width="650" align="center">
		 	<tr bgcolor="CCCCCC" align="center">
		 		<td>线路</td><td>距离站数</td><td>到达时间</td>
		 	</tr>
		 	<%rs.beforeFirst();
		 		while(rs.next()){
		 	 %><tr align="center">
		 	 <td><%=rs.getString("rid") %></td>
		 	 <td><%=rs.getString("rdistance") %></td>
		 	 <td><%=rs.getString("rtime") %></td>
		 	 </tr>
		 	 <%} %>
		 </table>
		 <%if(rs!=null){rs.close();} 
		 	if(pstmt!=null){pstmt.close();}
		 	if(conn!=null){conn.close();}
		 %>
	</body>
</html>