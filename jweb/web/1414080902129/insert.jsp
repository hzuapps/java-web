<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@page import="java.sql.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'stu_insert.jsp' starting page</title>

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
	<%
		String driver = "com.mysql.jdbc.Driver";
		String userName = "root";
		String userPwd = "123456";
		String dbName = "kuaidi";
		String url1 = "jdbc:mysql://localhost:3306/" + dbName;
		String url2 = "?user=" + userName + "&password=" + userPwd;
		String url3 = "&useUnicode=true&characterEncoding=UTF-8";
		String url = url1 + url2 + url3;
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url);
		String sql = "Insert into dingdan(stuname,stuphone,expressname,stuadd)values(?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		request.setCharacterEncoding("UTF-8");

		String stuname = request.getParameter("stuname");
		String expressname = request.getParameter("expressname");
		String stuadd = request.getParameter("stuadd");
		int stuphone = Integer.parseInt(request.getParameter("stuphone"));
		pstmt.setString(1, stuname);
		pstmt.setInt(2, stuphone);
		pstmt.setString(3, expressname);
		pstmt.setString(4, stuadd);

		int n = pstmt.executeUpdate();
		if (n == 1) {
	%>数据插入成功!
	<br>
	<%
		} else {
	%>数据插入失败!
	<br>
	<%
		}
		if (pstmt != null) {
			pstmt.close();
		}
		if (conn != null) {
			conn.close();
		}

		//stmt.close();
		// conn.close();
	%>
</body>
</html>
