<%@ page language="java" import="java.util.*" contentType="text/html" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta charset="UTF-8"/>
    <title>所有学生数据展示页</title>
	<style>
		table{width:800px;}
		table tr th,table tr td{border:1px solid #000;height:50px;text-align:center;}
	</style>
  </head>
  
  <body>
  	<font color=blue >
  	<h1>所有学生信息如下：</h1>
  	</font>
    <table>
    	<thead>
    		<tr>
    			<th>学号</th><th>课程号</th><th>成绩</th>
    		</tr>
    	</thead>
    	<tbody>
			<% 
				out.print(session.getAttribute("data"));
			%>
    	</tbody>
    </table>
  </body>
</html>
