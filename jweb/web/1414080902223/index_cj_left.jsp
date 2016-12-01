<%@ page language="java" import="java.util.*" contentType="text/html" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>菜单页面</title>
  </head>
  
  <body>
   	<p><a href="find_stu_all.jsp" target="right">列出全部学生成绩</a></p>
   	<p><a href="find_stu_tijiao.jsp" target="right">按条件查询学生成绩</a></p>
   	<p><a href="insert_stu_tijiao.jsp" target="right">新添加学生成绩</a></p>
   	<p><a href="delete_stu_tijiao.jsp" target="right">按条件删除学生成绩</a></p>
   	<p><a href="update_stu_tijiao.jsp" target="right">按条件修改学生成绩</a></p>
  </body>
</html>
