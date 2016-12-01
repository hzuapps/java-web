<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>删除页面</title>
  </head>
   <body>
    <form action=DeleteServlet method="post">
    <h3>删除记录</h3>
    学号：<input type="text" name="sno">
   <input type="submit"  value="提交">
    </form>
  </body>
</html>
