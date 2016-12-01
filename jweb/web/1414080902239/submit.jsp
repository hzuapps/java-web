<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'submit.jsp' starting page</title>
    
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
String driverName="com.mysql.jdbc.Driver";
String userName="root";
String userPwd="123456";
String dbName="clothes";
String url1="jdbc:mysql://localhost:3306/"+dbName;
String url2="?user"+userName+"&password="+userPwd;
String url3="&useUnicode=true&characterEncoding=UTF-8";
String url=url1+url2+url3;
Class.forName(driverName);
Connection conn=DriverManager.getConnection(url);
String sql="new(id,name,size,num)value(?,?,?,?)";
PreparedStatement pstmt=conn.prepareStatement(sql);
request.setCharacterEncoding("UTF-8");
int id=Integer.parseInt(request.getParameter("id"));
String name=request.getParameter("name");
int size=Integer.parseInt(request.getParameter("size"));
int num=Integer.parseInt(request.getParameter("num"));
pstmt.setInt(1,id);
pstmt.setString(2,name);
pstmt.setInt(3,size);
pstmt.setInt(4,num);
int n=pstmt.executeUpdate();
if(n==1){%>成功<%}
else{%>失败<%}
if(pstmt!=null){pstmt.close();}
if(conn!=null){conn.close();}
 %>
  </body>
</html>
