<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ page import="java.io.*,java.util.*,java.sql.*"%>

<%

String path = request.getContextPath();

String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>

<html>

	<head>

		<title>音乐列表</title>

	</head>

	<body>

		<%

			String driveName = "com.mysql.jdbc.Driver";

			String userName = "root";

			String userPwd = "";

			String dbName = "music";

			String url1 = "jdbc:mysql://localhost:3306/music";

			String url2 = "?user=root&password=";

			String url3 = "&useUnicode=true&characterEncoding=UTF-8";

			String url = url1+url2+url3;

			Class.forName("com.mysql.jdbc.Driver");

			Connection conn = DriverManager.getConnection(url);

			String sql = "select *from web";

			PreparedStatement pstmt = conn.prepareStatement(sql);

			ResultSet rs = pstmt.executeQuery();

			rs.last();

		 %>

		<table>
			<tr align="center">
			<td style="color:red">音乐名</td><td style="color:red">音乐类型</td>
			</tr>
			<%rs.beforeFirst();

		 		while(rs.next()){

		 	 %><tr align="center">

		 	 <td><%=rs.getString("music") %></td>

		 	 <td><%=rs.getString("MType") %></td>

		 	 </tr>

		 	 <%} %>
		</table>


		 <%if(rs!=null){rs.close();} 

		 	if(pstmt!=null){pstmt.close();}

		 	if(conn!=null){conn.close();}

		 %>

	</body>

</html>