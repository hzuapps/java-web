<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'failure.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		div{
			width:800px;
			margin:0 auto;
			text-align:center;
		}
	</style>
  </head>
  
  <body>
	<div>登录失败啦... ...密码或者用户名不正确！</div>
    <%response.setHeader("refresh", "5;url=login.jsp"); %>
	<div><b style="color:blue;"><span id=jump>5</span> 秒钟后页面将自动返回登录页面...</b></div>
   <script>
 	function countDown(secs){
 		jump.innerText=secs;
        if(--secs>0)
        	setTimeout("countDown("+secs+" )",1000);
    }
    countDown(5);
    </script>
  </body>
</html>
