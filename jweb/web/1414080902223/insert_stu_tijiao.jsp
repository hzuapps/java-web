<%@ page language="java" import="java.util.*" contentType="text/html" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>添加信息提交页面</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  
  <body>
    <form action="Insert" method="get">
    	
    	<table border="0" width="238" height="252">
    		<tr><td>学号</td><td><input type="text" name="stuid"/></td></tr>
    		<tr><td>课程号</td><td><input type="text" name="classno"/></td></tr>
    		<tr><td>成绩</td><td><input type="text" name="grade"/></td></tr>
    		
    		<tr align="center">
    			<td colspan="2">
    				<input type="submit" value="添加"/> &nbsp;&nbsp;&nbsp;&nbsp;
    				<input type="reset" value="取消">
    			</td>
    		</tr>
    	</table>
    </form>
  </body>
</html>
