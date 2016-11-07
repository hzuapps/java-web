<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.util.*,JDBC_package.JDBC_package"  %>

<%
request.setCharacterEncoding("utf-8");
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String age = request.getParameter("age");
String birthday = request.getParameter("birthday");
String birthplace = request.getParameter("birthplace");
String education_bg = request.getParameter("education_bg");
String email = request.getParameter("email");
String evaluate1 = request.getParameter("evaluate1");
String evaluate2 = request.getParameter("evaluate2");
String graduate = request.getParameter("graduate");
String name = request.getParameter("name");
String personimg = request.getParameter("personimg");
String sex = request.getParameter("sex");
String skill = request.getParameter("skill");
String telephone = request.getParameter("telephone");
String work_exp = request.getParameter("workexp");
if(age !=""/*&&birthday!=""&&birthplace!=""&&education_bg!=""&&email!=""&&evaluate1!=""&&evaluate2!=""&&name!=""&&sex!=""&&skill!=""&&telephone!=""&&workexp!=""*/)
{
	try
	{
		JDBC_package.getUrl("3306","test","root","");
		JDBC_package.SqlConnection();
		String update_age_birthday_birthplace = String.format("update imformation set age='%s',birthday='%s',birthplace='%s' where account='%s'",age,birthday,birthplace,JDBC_package.account);
		String update_educationbg_email_evaluate1_evaluate2= String.format("update imformation set education_bg='%s',email='%s',evaluate1='%s',evaluate2='%s' where account='%s'",education_bg,email,evaluate1,evaluate2,JDBC_package.account);
		String update_graduate_name_sex_skill= String.format("update imformation set graduate='%s',name='%s',sex='%s',skill='%s' where account='%s'",graduate,name,sex,skill,JDBC_package.account);
		String update_telephone_workexp= String.format("update imformation set telephone='%s',work_exp='%s' where account='%s' ",telephone,work_exp,JDBC_package.account);
		/*out.println(update_age_birthday_birthplace);
		out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
		out.println(update_educationbg_email_evaluate1_evaluate2);
		out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
		out.println(update_graduate_name_sex_skill);
		out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
		out.println(update_telephone_workexp);
		*/
		JDBC_package.getstmt();
		JDBC_package.update_table(update_age_birthday_birthplace);
		JDBC_package.getstmt();
		JDBC_package.update_table(update_educationbg_email_evaluate1_evaluate2);
		JDBC_package.getstmt();
		JDBC_package.update_table(update_graduate_name_sex_skill);
		JDBC_package.getstmt();
		JDBC_package.update_table(update_telephone_workexp);
		out.println("<h3 align='center'>提交成功</h3><br />");	
		out.println("<table align='center'><tr><td><a href='personal.jsp'>转到个人简历页面</a></td></tr></table>");
	}
	catch(Exception e)
	{
		out.println("<h3 align='center'>提交失败</h3>");
	}
}

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
   	
  </body>
</html>


