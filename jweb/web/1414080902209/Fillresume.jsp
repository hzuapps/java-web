<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 <%@ page import="java.io.*,java.util.*,java.sql.*"%>
 <%
 String path = request.getContextPath();
 String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
 %>
 <html>
 	<head>
 		<title>Fillresume</title>
 	</head>
 	<body>
 		 <p size="5" color="red" align="center">填写简历</p>
 		 <form action="sinsert.jsp" method="post">
 		 <table border="0"  width="250" align="center">
 		 	<tr><td>学号</td><td><input type="text" name="snum"></td></tr>
 		 	<tr><td>姓名</td><td><input type="text" name="sname"></td></tr>
 		 	<tr><td>个人简介</td><td><textarea name="sintrod" rows="5" cols="22"></textarea></td></tr>
 		 	<tr>
 		 		<td align="center" colspan="2">
 		 		<input type="submit" value="提交">
 		 		<input type="reset" value="取消">
 		 		</td>
 		 	</tr>	 	
 		 </table>
 		 </form>
 	</body>
 </html> 