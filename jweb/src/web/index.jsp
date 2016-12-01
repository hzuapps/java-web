<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 <%
 String path = request.getContextPath();
 String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
 %>
 
 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
 <html>
   <head>
     <base href="<%=basePath%>">
     
     <title>My JSP 'MyJsp.jsp' starting page</title>
     
 	<meta http-equiv="pragma" content="no-cache">
 	<meta http-equiv="cache-control" content="no-cache">
 	<meta http-equiv="expires" content="0">    
 	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
 	<meta http-equiv="description" content="This is my page">
 	<!--
 	<link rel="stylesheet" type="text/css" href="styles.css">
 	-->
 
 <head>
 	<title>手机话费充值卡销售系统</title>
 </head>
 <body>
 
     <h2 align="center">手机话费充值卡销售系统</h2>
     <form>
     <table align="center">
     <tr><td>充值号码：</td><td><input type="email" name="Email"></td></tr>
     <tr><td>充值金额：</td><td><input type="text" name="Name"></td></tr>
     <tr><td>充值卡账号：</td><td><input type="password" name="PW"></td></tr>
    <tr><td>充值卡密码：</td><td><input type="password" name="PW"></td></tr>
    
    </td>
    </tr>
     <tr>
     <td>
         <input type="submit" value="确定"> <input type="reset" value="取消">
     </td>
     </tr>
     </table>
     </form>
 
</body>
<html> 