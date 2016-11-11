<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.css">
    <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script src="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.js"></script>
    <base href="<%=basePath%>">
    
    <title>My JSP 'AssessmentInfo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		#tb,tr,th,td{
 		 border: 1px solid blue;
		}

		#tb{	
  			border-collapse:collapse; /*//设置单边框*/
		}
		
		td{
			width: 250px;
  			height: 30px;
  			text-align:center;
		}
		
		#div1{
			margin:5% 25% 5% 25%;
			padding:5% 5% 5% 5%;
		}
		body{
			background:#333333;
			color:#333;
		}
		.head{
			margin: 0 auto;
			width: 200px;
		}
		
	</style>

  </head>
  
  <body>
  
    <div id="div1">
        <form id="form1" action="<%=request.getContextPath() %>/UpdateGrades" method="post">
        	<div >
        		<table id="tb">
        		<div class="head"> 基本成绩</div>
        			<c:forEach var="grade" items="${gradesList }">
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
    
    <script type="text/javascript">
    	
    		$(function(){
    		
    			
    			
    			var name="subject";
    			var index=0;
    			$(":text").each(function(){
    		
    				$(this).attr("name",name+index).attr("id",name+index);
    				//alert($(this).val());
    				index++;
    			});
    			
    			});
    </script>
  </body>
</html>
