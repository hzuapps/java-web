<%@ page language="java" import="java.util.*" contentType="text/html" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>列出全部学生信息</title>
  </head>
  
  <body>
  	<font color=blue><i>
    <h2>所有学生信息展示如下</h2></i>
    <a href="Show_stu_info">点击展示</a>
  </body>
</html>
