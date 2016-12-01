<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'find.jsp' starting page</title>
    
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
request.setCharacterEncoding("UTF-8");
int id1=Integer.parseInt(request.getParameter("ID"));
int size1=Integer.parseInt(request.getParameter("SIZE"));
String sql="select * from clothes where id=? and size=?";
PreparedStatement pstmt=conn.prepareStatement(sql);
pstmt.setInt(1,ID);
pstmt.setInt(2,SIZE);
ResultSet rs=pstmt.executeQuery();
rs.last();
%>


<center><table>
<tr align="center">
<td><%=rs.getString("id") %></td>
<td><%=rs.getString("name") %></td>
<td><%=rs.getString("size") %></td>
<td><%=rs.getString("num") %></td>
</tr>
</table>
</center>
<%
if(rs!=null){rs.close();}
if(pstmt!=null){pstmt.close();}
if(conn!=null){conn.close();}
 %>

  </body>
</html>
