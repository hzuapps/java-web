<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
	<head>
		
	</head>
	<body>
		<%
			String driveName = "com.mysql.jdbc.Drive";
			String userName = "root";
			String userPwd = "";
			String dbName = "hh";
			String url1 = "jdbc:mysql://localhost:3306/routequery";
			String url2 = "?user=root&password=";
			String url3 = "&useUnicode=true&characterEncoding=UTF-8";
			String url = url1+url2+url3;
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(url);
			String sql = "select *from sql";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			rs.last();
		 %>
		 您的历史查询状态:
                    	<%rs.beforeFirst();
		 		while(rs.next()){
		 	 %><p><span>时间:rs.getTime();</span> <span>查询生物: rs.getAnimal()</span> <span>查询具体资料: rs.getDetail()</span> <span>查询结果: rs.getResult()</span><p>
		 	 <%} %>
		 <%if(rs!=null){rs.close();} 
		 	if(pstmt!=null){pstmt.close();}
		 	if(conn!=null){conn.close();}
		 %>
	</body>
</html>