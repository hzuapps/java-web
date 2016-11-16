<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  
    <title>成绩查询</title>
   
  </head>
  
  <body>
  
    <div >
        <form action="<%=request.getContextPath() %>/UpdateGrades" method="post">
        	<div >
        		<table id="tb">
        		<div > 基本成绩</div>
        			<c:forEach var="score" items="${gradesList }">
        				<tr>
        					<td>${grade.courseName }</td>
        					<td><input type="text" value=""></td>
        				</tr>        			
        			</c:forEach>
        		</table>
        		<button type="submit" id="sub">保存</button>
        	</div>
        </form>
    </div>
    

  </body>
</html>