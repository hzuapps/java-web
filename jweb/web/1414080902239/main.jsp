<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <title>XXXX</title>
  </head>
  <frameset rows="80,*">
  <frame src="title.jsp" scrolling="no">
  <frameset cols="140,*">
  <frame src="left.jsp" scrolling="no">
  <frame src="right.jsp" name="right" scrolling="no">
  </frameset>
  </frameset>
</html>
