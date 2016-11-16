<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
    
    <title>main.jsp</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">

	body{
 
  	font-family: 'Microsoft YaHei';
	}

	h1{
	  font-size: 45px;
	  height:60px;
	  padding-top:20px;
	}
	span{
	  float:right;
	  margin-right: 20px;
 	 font-size: 25px;	  
	}
	button{
 	   width: 370px;
 	   height: 45px;
	    margin-left: 190px;
	    margin-top:10px;
	    border-radius: 20px;
	    background: -webkit-gradient(linear, 0 0, 0 100%, from(#6BD9D4), to(#4BBFA5));
 	   color: white;
 	   font-size: 28px;
 	   outline: none;
 	   margin-top: 40px;
   }
	hr{
	  margin-bottom: 50px;
	}
	</style>
  </head>
  
  <body>
	 <h1 align="center">Welcome to the main page!</h1>
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
	 <c:forEach var="item" items="air conditioner,fan,TV,fridges,door,window" begin="0" step="1">
	 	<button><c:out value="${item}"/></button>
	 </c:forEach>
</form>
  </body>
</html>
