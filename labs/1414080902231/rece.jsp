<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML >
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>receive</title>

  </head>
  
  <body>
  		<%=new java.util.Date().toLocaleString() %>

 	<% String s1=request.getParameter("GoodsName");
 	   String s2=request.getParameter("Detail"); 
 	   String s3=request.getParameter("imgfile"); %>
  	<p>Goods Name:
    	<%=s1 %>
    </p>
    <p>Detail:
    	<%=s2 %>
    </p>
    <p>Pictures:
    	<%=s3 %>
    </p>
  </body>
</html>
