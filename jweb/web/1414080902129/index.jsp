<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%> 
<%@ page import="java.util.Date" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>代收寄快递系统</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.4.1.min.js"></script>

</head>

<style type="text/css">
     h3{font-size:12px;family:宋体;}

</style>
      <body>
		<h3 align="center">代收寄快递</h3>
		  <form name="express"action="1414080902129" method="post" >
		  	<table>
		  		<tr><td>学生姓名:</td><td><input type="text"name="stuname"></td></tr>
		  		<tr><td>手机号码:</td><td><input type="text"name="stuphone"maxlength=11></td></tr>
		  		<tr><td>快递名称:</td><td><input type="text"name="expressname"></td></tr>
		  	    <tr><td>宿舍地址:</td><td><input type="text"name="stuadd"></td></tr>
		  	    
		  	    <tr><td><input type="checkbox" name="d" value="1">代收快递
		  	    <input type="checkbox" name="d" value="2">代寄快递
		  	    </td></tr>
		  	    
		  		<tr><td></td><td><input type="submit" value="确认" ;"><input type="reset"value="取消"></td>
		  	</table>
		  	</form>
	        <br>
	        <img src="D:\github\高级网页设计\1.jpg" width="200" height="100" align="right">
		 
		  <div style="text-align: right">
		    <%
		  Date date=new Date();
		  SimpleDateFormat format=new SimpleDateFormat("yyyy年MM月dd日");
		  String str=format.format(date);
		  out.println(str);
		   %>
		  </div>
	
	
	  
	  
	  </body>
<script>
	$(function() {
			$("#a").click(function(event) {
				event.preventDefault();
				$.ajax({
					type: "get",
					url: "success.json",
					success: function(msg) {
						var aaaaa = msg;
						alert(aaaaa.msg);
					}
				});
			});
		})
</script>
</html>
