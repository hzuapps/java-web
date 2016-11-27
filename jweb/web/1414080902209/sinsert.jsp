<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>添加学生简历</title>
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
    	String sql="Insert into slist(snum,sname,sintrod)values(?,?,?)";
    	PreparedStatement pstmt=conn.prepareStatement(sql);
    	request.setCharacterEncoding("UTF-8");	
		String snum=request.getParameter("snum");
    	String sname=request.getParameter("sname");
    	String sintrod=request.getParameter("sintrod");
    	int n=0;
    	if(snum!=""&&sname!=""&&sintrod!="")
    	{
    	pstmt.setString(1,snum);
    	pstmt.setString(2,sname);
    	pstmt.setString(3,sintrod);
    	n=pstmt.executeUpdate();
    	}
    	
    	if(n==1){%>数据插入操作成功！<br><%}	
    	else{%>数据插入操作失败!<%}
    	if(pstmt!=null){pstmt.close();}
    	if(conn!=null){conn.close();}
     %>
  </body>
</html>