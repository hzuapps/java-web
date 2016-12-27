<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>展示贩卖机管理系统的主页面</title>
    
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
   <% Calendar rightNow=Calendar.getInstance();
      Integer Hour=new Integer(rightNow.get(Calendar.HOUR_OF_DAY));
      request.setAttribute("hour",Hour);
%>
  <h3><center>欢迎来到贩卖机管理系统界面</center></h3>
  <c:if test="${hour>=0&&hour<=10}"><center>欢迎你，早上好！</center></c:if>
  <c:if test="${hour>10&&hour<=19}"><center>欢迎你，下午好！</center></c:if>
  <c:if test="${hour>19&&hour<=24}"><center>欢迎你，晚上好！</center></c:if>

  <form action="denglu.jsp" method="post">
  <p>请输入你的员工号:
  <input type="test" name="你的账号"> 
  </p>
  <p>请输入你的登录密码:
  <input type="submit" name="你的密码" value="登录"> 
  </p>
</form>
</body>
</html>  