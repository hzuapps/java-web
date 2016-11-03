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


  </head>
 
    <body>
    <center>Now time is: 
         <%=new java.util.Date()%>
     </center>
  <form id="stu" action="">
     <table>
<tr><td>学生签到表</td></tr>
<tr><td>姓名：<input type="text"></td></tr>
<tr><td>学号：<input type="text"></td></tr>
<tr><td>日期：<input type="text"></td></tr>
<tr><td>缺勤情况：</td></tr>
<tr><td>
<textarea name="Letter" rows="5" cols="50"></textarea>
</td></tr>

<tr><td><button type="submit"  class="btn" >登记</button><input type="reset" value="取消" class="btn" ></td></tr>
</table>
</form>
<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
  <script src="index.js"></script>
  		<%  for(int i=0;i<4;i++){
	out.print(i+"   ");
} %>
  
  </body>
</html>
