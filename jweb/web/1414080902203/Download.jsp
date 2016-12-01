<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Download页面</title>
    
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
   	 <font color="Green"><h4>当前时间是:<%=new Date().toLocaleString()%><br>Hello student</h4></font>
   	 <br><hr>
   	 <%
   	 	Calendar rightNow=Calendar.getInstance(); 
   	 	Integer Hour=new Integer(rightNow.get(Calendar.HOUR_OF_DAY));
   	 	request.setAttribute("hour",Hour);
   	 %>
   	 
   	 <c:if test="${hour>=0&&hour<12}"><p align="center"> 上午好，X学生，正在下载文件，请稍后 </p></c:if>
   	 <c:if test="${hour==12}"> 中午好，X学生，正在下载文件，请稍后</c:if>
   	 <c:if test="${hour>12&&hour<=17}"> 下午好，X学生，正在下载文件，请稍后</c:if>
   	 <c:if test="${hour>=17&&hour<=23}"><p align="center">晚上好，X学生，正在下载文件，请稍后</c:if></p><hr><br>
   	 
   	 <%
   	 	String[] s1=request.getParameterValues("list1");
   	 	String s2=request.getParameter("list2");
   	 	String s3=request.getParameter("list3");
   	 	String[] s4=request.getParameterValues("list4");
   	 	%>
   	 	<table align="center" border="0" width="400" height="600">
   	 	<tr><td><h2>选择的课程结果如下:</h2><br><br></td></tr>
   	 	<tr><td><h4>选择的数学课程是:</h4>
   	 	<%
   	 	if(s1!=null){
   	 		for(int i=0;i<s1.length;++i) 
   	 		{
   	 			out.println(s1[i]+" ");
   	 		}
   	 	}%></td></tr><br>
   	 	<tr><td><h4>选择的英语课程是:</h4>
   	 	<%
   	 	if(s2!=null){
   	 			out.println(s2+" ");
   	 	}%></td></tr><br>
   	 	<tr><td><h4>选择的物理课程是:</h4>
   	 	<%
   	 	if(s3!=null){
   	 			out.println(s3+" ");
   	 	}%></td></tr>
   	 	<tr><td><h4>选择的计算机课程是:</h4>
   	 	<%
   	 	if(s4!=null)
   	 	{
   	 		for(int i=0;i<s4.length;++i)
   	 		{	out.println(s4[i]+" ");}
   	 	}%></td></tr>
   	 	</table>
   	
  </body>
</html>