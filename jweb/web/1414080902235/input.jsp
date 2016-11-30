<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'input.jsp' starting page</title>
    
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
   String power=(String)request.getAttribute("power");
   if("1".equals(power)){
   String driveName ="com.mysql.jdbc.Driver";
          	String dbName="web";
          	String url1="jdbc:mysql://localhost:3306/web";
          	String url2="?user=root&password=";
          	String url3="&useUnicode=true&charsetEncoding=UTF-8";
          	String url=url1+url2+url3;
          	Class.forName("com.mysql.jdbc.Driver");
          	Connection conn=DriverManager.getConnection(url);
          	String sql="Insert into user_information(username,userpwd,sex)values(?,?,?)";
          	PreparedStatement pstmt=conn.prepareStatement(sql);
          	request.setCharacterEncoding("UTF-8");
          	String sex=(String)request.getAttribute("users");
          	String username=(String)request.getAttribute("usern");
          	String userpwd=(String)request.getAttribute("userp");
          	pstmt.setString(1,username);
          	pstmt.setString(2,userpwd);
          	pstmt.setString(3,sex);
          	int n=pstmt.executeUpdate();
          	if(n==1){%>数据插入操作成功！<%}
          	else{%>数据插入操作失败!<%}
          	if(pstmt!=null){pstmt.close();}
          	if(conn!=null){conn.close();}
          	}
    %>
    <br/><a href="register.jsp">点击返回注册页面</a><br/>
    <a href="index.jsp">点击前往登陆</a>
  </body>
</html>
