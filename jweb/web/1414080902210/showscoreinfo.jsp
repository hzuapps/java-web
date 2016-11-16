<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    
    <title>成绩查询</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  </head>
  
  <body>
  	<p>你好！<c:out value="${sessionScope.user }"/></p>
  <hr>
    <div >
    		<h4 style="text-align=center"><c:out value="${sessionScope.user }"/>的基础成绩为：</h4>
    		<table>
    			<tr>
    				<td>课程名</td>
    				<td>学分</td>
    				<td>成绩</td>
    			</tr>
    			<c:forEach var="index" items="${gradesList}">
    				<tr>
	    				<td>
	    					<c:if test="${ not empty index.courseName }"> 
	    						${index.courseName }
	    					</c:if>
	    				</td>
	    				
	    				<td>
	    					<c:if test="${not empty index.credit  }"> 
	    						<c:out value="${index.credit}"/>
	    					</c:if>
	    					
	    				</td>
	    				
	    				<td>
	    					
	    					
	    					<c:choose>
   								<c:when test="${index.grade>=0&&index.grade<=100 }">
   									${ index.grade }	    
   								</c:when>
   								<c:otherwise> 
   									<c:out value="成绩为空"></c:out> 
   								</c:otherwise>
							</c:choose>
	    					
							
	    				</td>	
    				</tr>
    			</c:forEach>
    		</table>
    		
    	
    </div>
  </body>
</html>