<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/2.3.2/css/bootstrap.min.css">



<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="http://cdn.bootcss.com/bootstrap/2.3.2/js/bootstrap.min.js"></script>
<script language="javascript">
function validate(){
		var name=document.forms[0].USERNAME.value;
		var idcard=document.forms[0].IDcard.value;
		var cardnumber=document.forms[0].CardNumber.value;
		var pnumber=document.forms[0].Pnumber.value;
		var checknumber=document.forms[0].CheckNumber.value;
		if(name.length<=0) window.alert("用户名不能为空");
		else if(idcard.length!=18) window.alert("身份证必须为18位");
		else if(cardnumber.length!=10) window.alert("深圳通必须为10位号码");
		else if(pnumber.length!=11) window.alert("手机号码必须为11位");
		else if(checknumber.length!=5) window.alert("请输入5位验证码");
		else 
		window.alert("您已成功办理手机深圳通业务，请持有效身份证到就近的移动营业厅领取您的专属SIM卡，并进行实名认证");
		document.forms[0].submit();
		}

</script>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>绑定页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

  </head>
  
  <body>
    <form>
    <fieldset>

	<center>
		<div style="padding: 5px;width: 400px">
		<h4 align="center">&nbsp;&nbsp;&nbsp;申请绑定手机深圳通</h4>
		<table width="100%" padding=0>
			<tr>
				<td width="40%" align="right"> 姓名  &nbsp;</span></td>
				<td width="5%"><input type="text"  class="form-control" name="USERNAME" required="true" placeholder="请输入真实姓名"></td>
				<td width="5%" > <font color="red"> </font></td>
			</tr>
			
			<tr>
				<td align="right">身份证  &nbsp;</span></td>
				<td><input type="text" class="form-control" name="IDcard" required="true"  placeholder="请输入18位身份证号码"></td>
			</tr>
			
			<tr>
				<td align="right">深圳通卡号   </td>
				<td><input type="text"  class="form-control" name="CardNumber" required="true"  placeholder="请输入10位深圳通卡号"></td>
			
			</tr>
			<tr>
				<td align="right">手机号码  &nbsp;</span> </td>
				<td><input  type="text" name="Pnumber"  required="true" class="form-control" placeholder="请输入11位手机号码"></td>&nbsp;
				<td><input type="button" class="btn btn-default btn-sm" name="getCheckNumber" value=" 获取验证码"> </td>
				<td></td>
			</tr>
			<tr>
				<td align="right">验证码   &nbsp;</span> </td>
				<td><input type="text" name="CheckNumber" class="form-control" required="true" placeholder="请输入5位验证码"></td>
			</tr>
		</table>
			
		</div>
		<div align="center">
		<input type="submit" name="submit" class="btn btn-primary" id="ss" value="绑定" onclick="validate()" /	>	
		<input type="reset" name="reset" class="btn btn-primary" value="重置" >
		</div>
	</center>
</fieldset>
</form>
  </body>
</html>
