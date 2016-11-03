<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=GB18030" 
pageEncoding="GB18030"%> 
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>代收寄快递系统</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.4.1.min.js"></script>
</head>

      <body>
		<h3 align="center">代收寄快递</hS3>
		  <from name="express"action="">
		  	<table>
		  		<tr><td>学生姓名:</td><td><input type="text"name="Name"></td><tr>
		  		<tr><td>手机号码:</td><td><input type="text"name="Phone"maxlength=11></td><tr>
		  		<tr><td>快递名称:</td><td><input type="text"name="express name"></td><tr>
		  	    <tr><td>宿舍地址:</td><td><input type="text"name="address"></td><tr>
		  		<tr><td></td><td><input type="submit" value="代收快递" name="a" id="a" onclick="alert('请支付****');"><input type="submit" value="代寄快递" name="b" id="b" onclick="alert('请支付****');"><input type="reset"value="取消"></td><tr>
		  	</table>
		  </from>
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
