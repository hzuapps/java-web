<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
  
 <%
 String path = request.getContextPath();
 String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
 %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-cn">
<head>
 <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <meta http-equiv="pragma" content="no-cache">
 <meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
 	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
 	<meta http-equiv="description" content="This is my page">
 
 
    <title>社团面试管理系统</title>
    <link href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
<style>
h2{
margin-left:100px;
}
button{
margin:15px;
}
span{
 	  float:right;
 	  margin-right: 20px;
  	 font-size: 30px;	  
 	}
 	a:hover,a:visited,a:active,a:link
 	{color:white;text-decoration: none; }  
</style>
</head>

<body>

<div class="container" >

           <h1 class="text-center" style="margin-top: 100px">Welcome to Interview Management System</h2>
            <p class="text-center" >Now Time：<%= new java.util.Date() %></p>
			 <%
 	 	Calendar rightNow = Calendar.getInstance();
 	 	Integer Hour=new Integer(rightNow.get(Calendar.HOUR_OF_DAY));
 	 	request.setAttribute("hour", Hour);
  	 %>
  	 <c:choose>
  		 <c:when test="${ hour >= 0 && hour <= 11}"><span>Good morning, <c:out value="${param.username}" default="user"/>!</span></c:when>
  		 <c:when test="${ hour >= 12 && hour <= 17}"><span>Good afernoon, <c:out value="${param.username}" default="user"/>!</span></c:when>
  		 <c:otherwise><span>Good night, <c:out value="${param.username}" default="user"/>!</span></c:otherwise>
  	 </c:choose>
 	<hr width="100%" size="2">
 	 

			
			
			<% out.println("<h2>Now you can:</h2></br>");  %>
           <center>
           <c:forEach var="item" items="Viewdepart,Fillresume" begin="0" step="1">
 	 	<button type="submit" class="btn btn-success"><a href='${item}.jsp'>${item}</a></button>
 	 </c:forEach>
  	     
  	      	
  		</center>
          </form>
          </div>
       </div>
       
       
       <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
       <script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script> 
       
      <script src="index.js"></script>

</body>
</html>
	