<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.util.*,JDBC_package.JDBC_package" errorPage="" %>
<%
request.setCharacterEncoding("UTF-8");
JDBC_package.getUrl("3306","test","root","");
String select_userimformation = String.format("select * from user,imformation where user.account='%s' and password ='%s' and user.account = imformation.account",JDBC_package.account,JDBC_package.password);
try
{
	JDBC_package.getUrl("3306","test","root","");
	JDBC_package.SqlConnection();
	JDBC_package.getstmt();
	JDBC_package.select_table(select_userimformation);
	try
	{
		while(JDBC_package.result.next())
		{
			JDBC_package.name = JDBC_package.result.getString("name");
			JDBC_package.birthplace = JDBC_package.result.getString("birthplace");
			JDBC_package.birthday = JDBC_package.result.getString("birthday");
			JDBC_package.sex = JDBC_package.result.getString("sex");
			JDBC_package.email = JDBC_package.result.getString("email");
			JDBC_package.graduate = JDBC_package.result.getString("graduate");
			JDBC_package.personimg = JDBC_package.result.getString("personimg");
			JDBC_package.skill = JDBC_package.result.getString("skill");
			JDBC_package.work_exp = JDBC_package.result.getString("work_exp");
			JDBC_package.education_bg = JDBC_package.result.getString("education_bg");
			JDBC_package.evaluate1 = JDBC_package.result.getString("evaluate1");
			JDBC_package.evaluate2 = JDBC_package.result.getString("evaluate2");
			JDBC_package.age = JDBC_package.result.getInt("age");
			JDBC_package.telephone = JDBC_package.result.getString("telephone");
		}

	}
	catch(Exception e)
	{
		
	}
}
catch(Exception e)
{
}
 %>
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
<form action="" id="form_imformation" name="form_imformation" method="post">
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
			        <input readonly="true" type="text" id="birthplace" name="birthplace" width="125">
				</span></td>
			    <td width="240" class="style2">&nbsp;姓名:<input readonly="true" type="text" id="name" name="name" width="125"></td>
			</tr>
			<tr>
				<td width="212" height="21" class="style2">出生日期:<input readonly="true" type="text" id="birthday" name="birthday" width="125"></td>
			    <td width="240" class="style2">&nbsp;年龄:<input readonly="true" type="text" id="age" name="age" width="125"></td>
			</tr>
			<tr>
				<td width="212" height="20" class="style2">联系方式:<input readonly="true" type="text" id="telephone" name="telephone" width="125"></td>
			    <td width="240" class="style2">&nbsp;性别:<input readonly="true" type="text" name="sex" id="sex" ></td>
			</tr>
			<tr>
				<td width="212" height="21" class="style2">电子邮箱:<input readonly="true" type="text" id="email" name="email" width="125"></td>
			    <td width="240" class="style2">&nbsp;上传头像:</td>
			</tr>
			<tr>
				<td width="212" height="25" class="style2">毕业学校:<input readonly="true" type="text" id="graduate" name="graduate" width="125"></td>
			    <td width="240"><input readonly="true" type="file" name="file" id="file"></td>
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
				<td width="226" height="198"><br />&nbsp;&nbsp;&nbsp;<textarea readonly="true" id="skill" name="skill" rows="9"></textarea></td>
			    <td width="22"></td>
			    <td width="373" rowspan="2"><br /><br />&nbsp;<textarea readonly="true" id="workexp" name="workexp" rows="29" cols="45"></textarea></td>
			</tr>
			<tr>
				<td width="226" height="281">&nbsp;&nbsp;&nbsp;<textarea readonly="true" id="education_bg" name="education_bg" rows="15"></textarea></td>
			    <td width="22"></td>
		    </tr>
			<tr>
				<td width="226" height="177">&nbsp;&nbsp;&nbsp;<textarea readonly="true" id="evaluate1" name="evaluate1" rows="10"></textarea></td>
			    <td width="22"></td>
			    <td width="373"><br /><br />&nbsp;<textarea readonly="true" id="evaluate2" name="evaluate2" rows="7"cols="45"></textarea></td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</div>
<table align="center" width="615" height="30">
	<tr>
		<td align="right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" id="update" name="update" value="修改信息" onclick="location.replace('update.jsp')" /><!--<input type="button" id="accomplish" name="accomplish" value="完成编辑" onclick="f_check()">&nbsp;&nbsp;&nbsp;<input type="button" id="cancel" name="cancel" value="取消编辑">--></td>
	</tr>
</table>
</form>
</body>
</html>
<script type="text/javascript" src="http://cdn.bootcss.com/jquery/3.1.1/jquery.js"></script>
<script type="text/javascript">
	function f_check()
	{
		
	}
	function f_load()
	{
		form_imformation.name.value ="<%=JDBC_package.name%>";
		form_imformation.birthplace.value ="<%=JDBC_package.birthplace%>";
		form_imformation.birthday.value ="<%=JDBC_package.birthday%>";
		form_imformation.email.value="<%=JDBC_package.email%>";
		form_imformation.graduate.value="<%=JDBC_package.graduate%>";
		form_imformation.skill.value="<%=JDBC_package.skill%>";
		form_imformation.workexp.value="<%=JDBC_package.work_exp%>";
		form_imformation.age.value="<%=JDBC_package.age%>";
		form_imformation.telephone.value="<%=JDBC_package.telephone%>";
		form_imformation.education_bg.value="<%=JDBC_package.education_bg%>";
		form_imformation.evaluate1.value="<%=JDBC_package.evaluate1%>";
		form_imformation.evaluate2.value="<%=JDBC_package.evaluate2%>";
		form_imformation.sex.value="<%=JDBC_package.sex%>";
	}
	
</script>