<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-cn">
<head>
 <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>社团面试管理系统</title>
    <link href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
<style>
h2{
margin-left:100px;
}
button{
margin:15px;
}
</style>
</head>

<body>

<div class="container" >

           <h1 class="text-center" style="margin-top: 100px">Welcome to Interview Management System</h2>
            <p class="text-center" >Now Time：<%= new java.util.Date() %></p>
			<% out.println("<h2>Now you can:</h2></br>");  %>
           <center>
  	      <button type="submit" class="btn btn-success">View the information of departments</button>
  	      <button type="submit" class="btn btn-success">Fill in the personal information</button>
  	      	
  		</center>
          </form>
          </div>
       </div>
       
       
       <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
       <script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script> 
       
      <script src="index.js"></script>

</body>
</html>
	