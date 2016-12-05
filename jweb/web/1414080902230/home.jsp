<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
    <title>在线投票系统</title>
  </head>
  <body>
  	<%
  		Calendar rightNow=Calendar.getInstance();
  		Integer hour=new Integer(rightNow.get(Calendar.HOUR_OF_DAY));
  		request.setAttribute("hour",hour);
  	 %>
  	 <c:if test="${hour>=0&&hour<=11 }">上午好!</c:if>
  	 <c:if test="${hour>=12&&hour<=17 }">下午好!</c:if>
  	 <c:if test="${hour>=18&&hour<=23 }">晚上好!</c:if>
  	<h1 align="left">在线投票系统</h1>
  	 <p>希拉里&nbsp;&nbsp;肯尼迪</p>
  	<form action="vote_result.jsp" method="post">	
  		&nbsp;<input type="radio" name="candidate" value=">希拉里"></input>&nbsp;&nbsp;
  		<input type="radio" name="candidate" value="肯尼迪"></input><br><br>
  		&nbsp;<input type="submit" name="submit" value="提交" style="width:100px"></input>
  	</form>
  </body>
</html>
