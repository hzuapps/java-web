<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" import="java.util.*" contentType="text/html;  charset=utf-8"%>
<html>
  <head>
    <base href="<%=basePath%>">  
    <title>main.jsp</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head> 
  <body>
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
	<hr>
	 <c:forEach var="item" items="air conditioner,fan,TV,fridges,door,window" begin="0" step="1">
	 	<button><c:out value="${item}"/></button>
	 </c:forEach>
</form>
  </body>
</html>