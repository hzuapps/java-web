<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>提交</title>
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
  <%= new java.util.Date() %>
    <form id="regist">
  <div class="form-group">
    <label for="UserName">UserName</label>
    <input type="text" class="form-control" id="UserName" placeholder="UserName">
  </div>
  <div class="form-group">
    <label for="Password1">Password</label>
    <input type="password" class="form-control" id="Password" placeholder="Password">
  </div>
  <button type="button" class="btn btn-default">Submit</button>
</form>
<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	<script>
	        $( "#regist" ).click(function() {
        $.ajax({ 
          url: "Se1414080902221Servlet",
          datatype:"html", 
          type: "post",
          success: function(data){
            alert(data);
        }});
      });
    </script>
  </body>
</html>
