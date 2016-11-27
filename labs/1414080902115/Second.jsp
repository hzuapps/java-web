<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ page language="java" import="java.util.*,edu.hzu.javaweb.labs.se1414080902115.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Second.jsp' starting page</title>
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
    
   
    <c:choose>
    <c:when test="${fn:contains(user,'admin')}">你好，管理员！</c:when>
    <c:otherwise>  <c:out value="${user}" default="wrong"></c:out> ,你好，欢迎来到惠州学院图书馆！</c:otherwise>
    </c:choose>
    <br>
    
    <div >
     <table border="0">
     <%
    	StudentDAO sd = new StudentDAO();
    	Student stu=new Student();
  // Student yy=new Student();
     stu.setId(Integer.parseInt(request.getParameter("username")));
      stu=sd.find(stu);
    	
    	%>
<form action="" method="post">
   <table border="0 " width="238" height="252">
   <tr><td>学 号:</td><td><%=stu.getId()%></td></tr>
   <tr><td>姓 名:</td><td><%=stu.getName()%></td></tr>
   <tr><td>性 别:</td><td><%=stu.getSex()%></td></tr>
   <tr><td>年 龄:</td><td><%=stu.getAge()%></td></tr>
   <tr><td>体 重:</td><td><%=stu.getWeight()%></td></tr>
   <tr><td>身 高:</td><td><%=stu.getHeight()%></td></tr>
   <tr align="center">
   <td colspan="2">
  
   </td>
   </tr>
   </table>
   </form>
    </div>
    <ul>
     根据所借图书，推荐阅读书籍如下列：
     <c:forEach var="name" items="《淡定的人生不寂寞》,《你能行》,《口才的魅力》" begin="0" step="1">
     <li>
    <c:out value="${name}"></c:out>
   </li>
    </c:forEach>
     </ul>
   
    </div>
    
    
   
   
  </body>
</html>
