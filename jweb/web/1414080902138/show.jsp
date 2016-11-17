<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Show Page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <h4 align="center">
<%       
         List a=new ArrayList();
         a.add("ASD");
         a.add("123");
         a.add("man");
         a.add("18");
        a.add("1.75");
        a.add("55");
     request.setAttribute("a",a); 
 	 	Calendar rightNow = Calendar.getInstance();
 	 	Integer Hour=new Integer(rightNow.get(Calendar.HOUR_OF_DAY));
 	 	request.setAttribute("hour", Hour);
  	 %>
  	 </br></br></br></br>
  	 <c:choose>
  		 <c:when test="${ hour >= 6 && hour <= 18}"><p>Now is the day,welcome, <c:out value="${param.Username}" default="HCJ"/>!</p></c:when>
  		 <c:otherwise><p>Now is the night,welcome, <c:out value="${param.Username}" default="HCJ"/>!</p></c:otherwise>
  	 </c:choose>
  	 <c:if test='<%= request.getParameter("UserName") != null %>'>
        The <%= request.getParameter("UserName") %> 's message have added successful!</br></br>
    </c:if>     	 
    <c:forEach var="staff" items="${a}">
    &nbsp;<c:out value="${staff}"/>&nbsp;&nbsp;&nbsp;&nbsp;
     </c:forEach> 
     </h4> 	 
  </body>
</html>
