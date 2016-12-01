<%@ page language="java" import="java.sql.*,java.util.*,edu.hzu.javaweb.labs.se1414080902234.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Result.jsp' starting page</title>
    
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
    String mykw=(String)request.getAttribute("keyword");

    DocDAO dao=new DocDAO();
    List<Doc> clist=dao.allDoc(mykw);
    pageContext.setAttribute("doclist",clist);
       /* String driverName = "com.mysql.jdbc.Driver";
	    String userName = "root";
	    String userPwd = "root";
	    String dbName = "test";
	    String url1="jdbc:mysql://localhost:3306/"+dbName;
	    String url2="?user="+userName+"&password="+userPwd;
	    String url3="&useUnicode=true&characterEncoding=UTF-8";
	    String url=url1+url2+url3;
	    Class.forName(driverName);
	    Connection conn=DriverManager.getConnection(url);
	    String sql="select * from doc where name like ?";
	    PreparedStatement pstmt=conn.prepareStatement(sql);
	    pstmt.setString(1, mykw);
	    ResultSet rs=pstmt.executeQuery();
		System.out.println("mykw");
	    rs.last();
	    rs.beforeFirst();*/
%>
<table>
 <tr>
 <td>资料名</td>
 <td>存储地址</td>
 </tr>
 <c:forEach var="doc" items="${doclist}">
 <tr>
 <td>${doc.docname }</td>
 <td>${doc.docpath }</td>
 </tr>
 </c:forEach>
 </table>
  </body>
</html>
