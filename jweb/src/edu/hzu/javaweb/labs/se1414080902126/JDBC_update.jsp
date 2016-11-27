<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ page import="java.sql.*" %>
<%@ page import="com.mysql.jdbc.Driver" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.mysql.jdbc.Driver" %>
<%@ page import="dao.*" %>
<%@ page import="dbc.*" %>
<%@ page import="vo.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'JDBC_update.jsp' starting page</title>
    
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

    String id="10001";
    
	
    
    User user1 =new User();
    User duser=new User();
    UserDao userdao = new UserDao();
    user1.setUserid(id);

	duser=userdao.findUserById(id);
	String status=duser.getUserstatus();
    String account=duser.getaccount();
	System.out.print("yes!!!");

    %>
  <table align="center">
  		<tr ><th>当前账号：</th><th><%= id %></th></tr>
   		<tr ><th>使用状态：</th><th><%= status %></th>
    	<tr ><th>余额：</th><th><%= account %></th>
		<form action="test.jsp" method="post">
    	<tr ><td>充值金额：</td><td><input type="text" name="number" id="str"></td></tr>
    	<tr ><td><input type="submit" value="充值" ></td></tr>
   		
        </form>
  </table>
  </body>
</html>
