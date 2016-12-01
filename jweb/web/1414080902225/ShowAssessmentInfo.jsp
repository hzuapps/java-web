<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	
	<style type="text/css">
		#div1{
			margin:10% 10% 10% 10%;
			padding:5% 5% 5% 5%;
			background:#888;
			border:1px solid blue;
		}
		
		#tb{	
  			border-collapse:collapse; /*//设置单边框*/
		}
		
		td{
			width: 150px;
  			height: 30px;
  			text-align:center;
		}
		body{
			background:#666;
		}
	</style>

  </head>
  
  <body>
  	<p>你好！<c:out value="${sessionScope.user }"/></p>
  <hr>
    <div id="div1">
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
