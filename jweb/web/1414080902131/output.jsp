<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>信息显示页面</title>
    
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
<%request.setCharacterEncoding("utf-8");
Calendar rightNow=Calendar.getInstance();
Integer Hour=new Integer(rightNow.get(Calendar.HOUR_OF_DAY));
request.setAttribute("hour",Hour);
%>
<c:if test="${hour>=0&&hour<=11}"><c:out value="${param.username}"/>上午好！</c:if>
<c:if test="${hour>=12&&hour<=17}"><c:out value="${param.username}"/>下午好！</c:if>
<c:if test="${hour>=18&&hour<=23}"><c:out value="${param.username}"/>晚上好！</c:if>
您的当前的借款信息如下：<br>
借款数目：<%=request.getAttribute("message1") %>
借款期限：<%=request.getAttribute("message2") %>
还款方式：<%=request.getAttribute("message3") %>
借款日期：<%=request.getAttribute("message4")%>
您的利率为：<%=request.getAttribute("outmessage1") %>
您所应还款的总额为：<%=request.getAttribute("outmessage2") %>
<h4>请浏览您的历史账单</h4>
<div>
<c:forEach> var="show"item="${bill}">
<label>账单<c:out value="${show.num}"/></label>
<label>借款数目</label>
<c:out value="${show.money1}"/>
<label>还款期限</label>
<c:out value="${show.qixian}"/>
<label>还款方式</label>
<c:out value="${show.repayment}"/>
<label>您的利率</label>
<c:out value="${show.rate}"/>
<label>应还款的总额</label>
<c:out value="${show.sum}"/>
<label>借款日期</label>
<c:out value="${show.date}"/>
</c:forEach>
</div>
</body>
</html>