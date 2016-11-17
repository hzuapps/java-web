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
    
    <title>显示结果页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script language="javascript">
		function pay()
		{
			var a=document.getElementById("str").value;
			alert("充值成功！！！");
			location.reload();
			
		}
	</script>

  </head>
  
  <body>
  	<c:if test="${outputMessage==null}">  
	<% response.sendRedirect("index.jsp"); %>
	</c:if>  
  	
  	<% String state="正常"; %>
  	<% String name="1414080902126"; %>
  	<% int balance=100; %>
    <h2 align=center>饭卡管理系统</h2> <br>
    <hr width="100%" size="1" color="#00ffee">
    
    
    <c:out value="${outputMessage}">使用的表达式结果为null</c:out><br/>

    <h3 align="center">
    <tr >
    <table>
    <tr ><th>当前账号：</th><th><%= name %></th></tr>
    <tr ><th>使用状态：</th><th><%= state %></th>
    <tr ><th>余额：</th><th><%= balance %></th>
    </table>
    <br>
    <from>
    <tr ><td>充值金额：</td><td><input type="text" name="number" id="str"></td></tr>
    <tr ><td><input type="submit" value="充值" onclick="pay()"></td></tr>
    </from>
    
    </h3>
  </body>
</html>
