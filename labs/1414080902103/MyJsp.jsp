<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>学生签到登记表</title>


    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <script src="index.js"></script>

  </head>
 
    <body>
    <center>Now time is: 
         <%=new java.util.Date()%>
     </center>
  <form id="stu" action=""  method="post">
     
<div>学生签到表</div>
<div>姓名：<input type="text"  id="name" ></div>
<div>学号：<input type="text"  id="id" ></div>
<div>日期：<input type="text"  id="date" ></div>
<div>缺勤情况：</div>
<div>
<textarea name="Letter" rows="5" cols="50"  id="note" ></textarea>
</div>

<div><button type="submit"  class="btn" onclick="formSubmit.Deal()">登记</button><input type="reset" value="取消" class="btn" ></div>

</form>
<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
  <script src="index.js"></script>
  		<%  for(int i=0;i<4;i++){
	out.print(i+"   ");
} %>
  
  </body>
</html>
