<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.util.*,Bean.Bean1" errorPage="" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
 <jsp:useBean id="worker" class="Bean.Bean1" scope="session"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>个人简历页面</title>
<style type="text/css">
body
{
	padding:  0px;
	margin: 0px;
}
div
{
	align : center;
}
#table1 
{
 align : center;
}
h3
{
	color:#FF00FF;
}
.STYLE1 {color: #FF0000}
.style2{font-size: 8px}
</style>
</head>
<div>
<body  onLoad="f_load()">
<h3 align="center">个人简历</h3>
<hr width="615" />
<form action="" id="form_imformation" name="form_imformation" method="get">
<table width="615" height="190" align="center" id="table1" name="table1">
	<tr background="<%=request.getContextPath()%>/image/head.png" >
		<td>
		<table width="608" height="169" align="center">
			<tr>
				<td width="212" height="24"></td>
			    <td width="240"></td>
				<td width="140" rowspan="6"><img src="<%=request.getContextPath()%>/image/123.jpg" rowspan="6" height="140" width="140"></td>
			</tr>
			<tr>
				<td width="212" height="25">&nbsp;<span class="style2">籍贯:
			        <input  type="text" id="birthplace" name="birthplace" width="125">
				</span></td>
			    <td width="240" class="style2">&nbsp;姓名:<input  type="text" id="name" name="name" width="125"></td>
			</tr>
			<tr>
				<td width="212" height="21" class="style2">出生日期:<input  type="text" id="birthday" name="birthday" width="125"></td>
			    <td width="240" class="style2">&nbsp;年龄:<input  type="text" id="age" name="age" width="125"></td>
			</tr>
			<tr>
				<td width="212" height="20" class="style2">联系方式:<input  type="text" id="telephone" name="telephone" width="125"></td>
			    <td width="240" class="style2">&nbsp;性别:<input  type="text" name="sex" id="sex" ></td>
			</tr>
			<tr>
				<td width="212" height="21" class="style2">电子邮箱:<input  type="text" id="email" name="email" width="125"></td>
			    <td width="240" class="style2">&nbsp;上传头像:</td>
			</tr>
			<tr>
				<td width="212" height="25" class="style2">毕业学校:<input  type="text" id="graduate" name="graduate" width="125"></td>
			    <td width="240"><input  type="file" name="file" id="file" onchange="if(this.value)insertTitle(this.value);"></td>
			</tr>
			<tr>
				<td width="212" height="13"></td>
			    <td width="240"></td>
				<td width="140"></td>
			</tr>
		</table>
	  </td>
  </tr>
</table>
<table width="645" height="611" align="center" id="table1" name="table1">
	<tr>
		<td width="679" height="605" align="right" background="<%=request.getContextPath()%>/image/body.jpg">
		<table>
			<tr>
				<td width="226" height="198"><br />&nbsp;&nbsp;&nbsp;<textarea  id="skill" name="skill" rows="9"></textarea></td>
			    <td width="22"></td>
			    <td width="373" rowspan="2"><br /><br />&nbsp;<textarea  id="workexp" name="workexp" rows="29" cols="45"></textarea></td>
			</tr>
			<tr>
				<td width="226" height="281">&nbsp;&nbsp;&nbsp;<textarea  id="education_bg" name="education_bg" rows="15"></textarea></td>
			    <td width="22"></td>
		    </tr>
			<tr>
				<td width="226" height="177">&nbsp;&nbsp;&nbsp;<textarea  id="evaluate1" name="evaluate1" rows="10"></textarea></td>
			    <td width="22"></td>
			    <td width="373"><br /><br />&nbsp;<textarea id="evaluate2" name="evaluate2" rows="7"cols="45"></textarea></td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</div>
<table align="center" width="615" height="30">
	<tr>
		<td align="right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" id="accompolish" name="accomoplish" value="修改完成" onclick="f_update()"/>&nbsp;&nbsp;&nbsp;<input type="button" id="cancel" name="cancel" value="取消编辑" onclick="location.replace('personal.jsp')"></td>
	</tr>
</table>
</form>
</body>
</html>
<script type="text/javascript" src="http://cdn.bootcss.com/jquery/3.1.1/jquery.js"></script>
<script type="text/javascript">
	function f_update(tValue)
	{
		form_imformation.action="/javaweb/edu.hzu.javaweb.labs/Se1414080902117";
		form_imformation.submit();
	}
	function f_load()
	{
	}

</script>
