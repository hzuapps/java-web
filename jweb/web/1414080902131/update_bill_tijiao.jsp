<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改记录的条件提交页面</title>
    
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
    请选择修改记录所满足的条件<hr width="100%"size="3">
    <form action="update_bill_edit.jsp"method="post"><br>
     姓名：<input type="text"name="jname"><br><br>
    状态：未还款<input type="radio"value="未还款"name="state">
           已还款<input type="radio" value="已还款"name="state"><br><br>
           <input type="submit"value="提交">
           &nbsp;&nbsp;&nbsp;&nbsp;
           <input type="reset"value="取消">
    </form>
  </body>
</html>
