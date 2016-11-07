<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
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
  <form method="post" action="Servlet">
     请输入第一个动物类型： <input name="cls" type="text" style="margint-top:10px;width:120px"><br>
     请输入第一个动物年龄： <input name="age" type="text" style="margint-top:10px;width:120px"><br>
     请输入第二个动物类型： <input name="cls1" type="text" style="margint-top:10px;width:120px"><br>
     请输入第二个动物年龄： <input name="age1" type="text" style="margint-top:10px;width:120px"><br>
    <input type="submit" value="提交"><br>
    </form>
  结果:
  <c:out value="${1+2}" default=""/>
  <c:forEach var="l" items="${list}">
 			<c:out value="${l.cls}"/>
 			<c:out value="${l.age}"/>
 			<c:out value="${l.weight}"/>
 			<c:out value="${l.height}"/>
		</c:forEach>
</br>

  </body>
</html>
<script>
/*var btn = document.getElementById("sb");
sb.onclick = function(){
  var xml = new XMLHttpRequest();
  var ipt =document.getElementsByTagName("input")
  var js = "cls="+ipt[0].value+"&age="+ipt[1].value+"&cls1="+ipt[2].value+"&age1="+ipt[3].value;
  console.log(js)
  xml.open("post", "Servlet", true);
  xml.setRequestHeader("Content-type","application/x-www-form-urlencoded");
  xml.send(js);
  }*/
</script>
