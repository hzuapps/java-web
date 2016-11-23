<%@page import="com.domain.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,com.db.*,edu.hzu.javaweb.labs.se1414080902210.StudentDAO"%>
<html>
    <head> <title>由提交页面获取查询条件并实现查询的页面</title> 
    </head>
    <style>
		table{
			margin-left:auto;
			margin-right:auto;
		}
		tr{
			text-align:center;
			bgcolor:cccccc;
		}
		hr{
			width:100%;
  			size:3;
		}
	</style>  
    <body> 
    	  <% 	
    	  	Student student = (Student)request.getAttribute("result");
    	  %>
    	  请修改学生信息<hr>      
          <form action="Update" method="post" >          
            <table>	
                  <tr><td>学号</td><td><input type="text" name="id" value=<%=student.getId() %>></td></tr>
                  <tr><td>姓名</td><td><input type="text" name="name" value=<%=student.getName() %>></td></tr>
                  <tr><td>性别</td><td><input type="text" name="sex" value=<%= student.getSex() %>></td></tr>
                  <tr><td>年龄</td><td><input type="text" name="age" value=<%= student.getAge() %>></td></tr>
                  <tr><td>体重</td><td><input type="text" name="weight" value=<%= student.getWeight() %>></td></tr>
                  <tr><td>身高</td><td><input type="text" name="hight" value=<%= student.getHight()%>></td></tr>
             <tr>
                  <td colspan="2">
                  		<input type="hidden" name="id" value=<%=student.getId() %>>	
                  		<input type="Submit"  value="修改">
                  		&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="reset" value="取消">
                  </td>                  
             </tr>             
           </table> 
           </form>              
    </body>
</html>