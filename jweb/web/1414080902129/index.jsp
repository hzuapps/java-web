<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=GB18030" 
pageEncoding="GB18030"%> 
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>���ռĿ��ϵͳ</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.4.1.min.js"></script>
<script>
window.onload=function()
{
var btn=document.getElementById("hehe");
var form=document.forms[0];
btn.onclick=function()
{
	form.action="14140809021292";
	form.submit();
}
}

</script>
</head>
<style type="text/css">
     h3{font-size:12px;family:����;}
    
</style>
      <body>
		<h3 align="center">���ռĿ��</h3>
		  <form name="express"action="1414080902129" method="get" >
		  	<table>
		  		<tr><td>ѧ������:</td><td><input type="text"name="stuname"></td></tr>
		  		<tr><td>�ֻ�����:</td><td><input type="text"name="stuphone"maxlength=11></td></tr>
		  		<tr><td>�������:</td><td><input type="text"name="expressname"></td></tr>
		  	    <tr><td>�����ַ:</td><td><input type="text"name="stuadd"></td></tr>
		  		<tr><td></td><td><input type="submit" value="���տ��" ;"><input type="reset"value="ȡ��"></td><input id="hehe" type="submit" value="���" ;" onclick=""></tr>
		  	</table>
		
		 
		  <div style="text-align: right">
		    <%
		  Date date=new Date();
		  SimpleDateFormat format=new SimpleDateFormat("yyyy��MM��dd��");
		  String str=format.format(date);
		  out.println(str);
		   %>
		  </div>
		 <img src="D:\github\�߼���ҳ���\1.jpeg" align="right" width="400">
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
