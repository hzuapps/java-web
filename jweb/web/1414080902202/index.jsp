<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
<meta charset="utf-8">
 <!-- 新 Bootstrap 核心 CSS 文件 -->
 <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
 <!-- 可选的Bootstrap主题文件（一般不用引入） -->
 <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">
 <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
 <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
 <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
 <script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
 <script src="index.js"></script>
 <style type="text/css">
 body{
   background-color:#FFCC00;
 }
.text2{border:3px;width:350px;height:50px;font-size:16px;line-height:1.6;}
.bt{
      width:100px; 
    }
 </style>
 <head>
<title>某滴出行网。</title>
</head>

<body bgcolor="yellow">
<% 	
	String str1=request.getParameter("textfield3");
	session.setAttribute("DENGLUHAO",str1); 
%>
<form action=""method="post"id="target">
<% 	
			Calendar now=Calendar.getInstance();
      		Integer Hour=new Integer(now.get(Calendar.HOUR_OF_DAY));
       		request.setAttribute("hour", Hour);
         
%>
        <div>
        <p align="center"> 
        	<c:if test="${hour>=0&&hour<=11 }">上午好！</c:if>
        	<c:out value="${DENGLUHAO}用户"></c:out> 
        </p>
        
        <p align="center">  
        	<c:if test="${hour>=12&&hour<=17 }">下午好！</c:if>
        	<c:out value="${DENGLUHAO}用户"></c:out>
        </p>
        
        <p align="center">  
        	<c:if test="${hour>=18&&hour<=23 }">晚上好！</c:if>
        	<c:out value="${DENGLUHAO}用户"></c:out>
        </p>
        </div>
<hr size="15px" noshade>
<p align="center"><font size="5"color="#ffffff"><b>您好，您现在要去哪儿？</b></font></p>
<ul>
<li>
<p>
<a href="http://developer.baidu.com/map/carhome.htm"><font size="5"color="#ffffff">您现在在哪？(查看定位)</font></a>
</p></li>
<br>
<li>
<p>
<a href="http://developer.baidu.com/map/carhome.htm"><font size="5"color="#ffffff">您要去哪儿？</font></a>
</p>
</li>
</ul>
<hr size="15px" noshade>
<p>
<font size="5"color="#ffffff"><b>您想搭乘：</b></font>
</p>
<p>
<input type="checkbox"name="way1"value="A1"><font size="4"color="#ff6600">快车</font></input>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="checkbox"name="way2"value="A2"><font size="4"color="#ff6600">出租车</font></input>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="checkbox"name="way3"value="A3"><font size="4"color="#ff6600">专车</font></input>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="checkbox"name="way4"value="A4"><font size="4"color="#ff6600">顺风车</font></input>
</p>
<p align="center">
<a href="1414080902202"><font size="5"color="#ffffff">计价规则</font></a>
</p>
<br> 
<p align="center">
<input style="background:#ffffff;color:black;width: 250px; height: 50px;"type="submit"class="btn"id="button1"value="呼叫快车"></input>
</p>
<br>
<p>
<font size="5"color="#ffffff"><b>祝您乘坐愉快！*—*</b></font>
</p>
</form>
</body>                                                        
</html>
