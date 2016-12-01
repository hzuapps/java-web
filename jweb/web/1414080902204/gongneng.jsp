<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/2.3.2/css/bootstrap.min.css">



<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="http://cdn.bootcss.com/bootstrap/2.3.2/js/bootstrap.min.js"></script>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'gongneng.jsp' starting page</title>
    
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
  <% String str1=request.getParameter("kahao");
  	session.setAttribute("KAHAO", str1);
  	
   %>
       <% Calendar now=Calendar.getInstance();
       		Integer Hour=new Integer(now.get(Calendar.HOUR_OF_DAY));
       		request.setAttribute("hour", Hour);
       
        %>
        <div>
      <p align="right">   <c:if test="${hour>=0&&hour<=11 }">上午好！<c:out value="${param.kahao}用户"></c:out> </c:if></p>
       <p align="right">   <c:if test="${hour>=12&&hour<=17 }">下午好！<c:out value="${param.kahao}用户"></c:out></c:if></p>
       <p align="right">   <c:if test="${hour>=18&&hour<=23 }">晚上好！<c:out value="${param.kahao}用户"></c:out></c:if></p>
        
        </div>
        
        </br>
        </br>
        </br>
        </br>
        </br>
        <div align="center">
        请选择你要执行的操作
        
        </div>
        <br>
        <div>
       <p align="center"><a href="jiechubangding.jsp" target="right"> 解除绑定</a></p>
        <p align="center"><a href="chaxunyue.jsp" target="right"> 查询余额</a></p>
       </div>
  </body>
</html>
