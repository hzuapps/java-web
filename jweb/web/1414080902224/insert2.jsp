<%@page language="java" import="java.sql.*" pageEncoding="UTF-8">
<html>
<head>
<tile>利用PreparedStatement对象添加一条记录页面</title>
</head>
<body>
<%
		String driverName="com.mysql.jdbc.Driver";
		String userName="root";
		String userPwd="root";
		String dbName="biji";
		String url1="jdbc:mysql:/localhost:3306/"+dbName;
		String url2="?user="+userName+"&password="+userPwd;
		String url3="&userUnicode=true&characterEncoding=UTF-8";
		String url=url1+url2+url3;
%>
		Class.forName(driverName);
		Connection conn=DriverManager.getConnection(url);
		String sql="Insert into stu_info(id,text) values(?,?)";
		PrepareStatement pstmt=conn.prepareStatement(sql);
		request.setCharacterEncoding("UTF-8");
		int id=Integer.parseInt(request.getParameter("id"));
		String text=request.getParameter("text");
		pstmt.setInt(1,id);
		pstmt.setString(2,text);
		int n=pstmt.executeUpdate();
		if(n==1){%>数据插入成功!}<br><%}
		else{%>失败!}<br><%}
		if(pstmt!=null){pstmt.close();}
		if(conn!=null){conn.close();}%>
</body>
</html>
