
<%@ page language="java" import="java.util.*,Bean.Student,dao.StudentDao" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
 
    <title>更新</title>
    
<%  StudentDao studao=new StudentDao();
    List<Student> student=studao.findAll(); 
    %>
</head>
  <body>
    <font size="5" color="red"></font>
		<table border="2" bgcolor="ccceee" width="650">
			<tr bgcolor="CCCCCC" align="center">
				<td>学号</td>
				<td>姓名</td>
				<td>性别</td>
				<td>年龄</td>
				<td>体重</td>
				<td>身高</td>
				<td>长跑</td>
				<td>短跑</td>
				<td>肺活量</td>
			</tr>
			<% 
			 for(Student stu:student){%>
			<tr>
			<td><%=stu.getSno() %></td>
			<td><%=stu.getName() %></td>
			<td><%=stu.getSex() %></td>
			<td><%=stu.getAge() %></td>
			<td><%=stu.getWeight() %></td>
			<td><%=stu.getHight() %></td>
			<td><%=stu.getLongRun() %></td>
			<td><%=stu.getShortRun() %></td>
			<td><%=stu.getPulmonary() %></td>
			</tr>
			<% }%>

  </body>
</html>
