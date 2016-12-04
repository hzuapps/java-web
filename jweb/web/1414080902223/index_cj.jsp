<%@ page language="java" import="java.util.*" contentType="text/html" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>学生成绩管理系统</title>

  </head>
  
    <frameset rows="80,*">
    	<frame src="index_cj_title.jsp" scrolling="no">
    	<frameset cols="140,*">
    		<frame src="index_cj_left.jsp" scrolling="no">
    		<frame src="index_cj_right.jsp" scrolling="no" name="right">
    	</frameset>
    </frameset>
</html>