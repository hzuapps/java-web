<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<title>录入学生信息</title>
  </head>
  
  <body>
  	<h2 align="center">录入学生信息</h2>
  		<form name="stu" action="">
  			<table>
  			<tr><td>学号：</td><td><input type="text" name="stuNum"></td></tr>
  			<tr><td>姓名：</td><td><input type="text" name="stuName"></td></tr>
  			<tr><td>性别：</td>
  				<td><input type="radio"name="stuSex" checked="checked">男
  				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  					<input type="radio"name="stuSex">女
  				</td>
  			</tr>
  			<tr><td>院系：</td>
 				<td><select name="stuSelect">
					<option selected>电子信息与电气学院</option>
					<option>旭日广东服装学院</option>
					<option>化学与材料工程学院</option>
  					<option>信息科学技术学院</option>
  					<option>经济管理学院</option>
  					<option>建筑与土木工程学院</option>
  					<option>地理与旅游学院</option>
  					<option>美术与设计学院</option>
  					<option>数学与大数据学院</option>
  					<option>生命科学学院</option>
  					<option>体育学院</option>
  					<option>外国语学院</option>
  					<option>音乐学院</option>
  					<option>文学与传媒学院</option>
  					<option>政法学院</option>
  					<option>马克思主义学院</option>
  					<option>教育科学学院</option>
  					<option>继续教育学院</option>
  					</select>
  				</td>
  			</tr>
  			<tr><td>专业:</td><td><input type="text" name="stuSelect2"></td></tr>
  			<tr><td>原毕业学校：</td><td><input type="text"name="stuSchool"></td></tr>
  			<tr><td>身份证号：</td><td><input type="text" name="stuNumber"></td></tr>
  			<tr><td>政治面貌：</td>
  				<td><input type="radio"name="stuChoose" checked="checked">群众
  					<input type="radio"name="stuChoose">团员
  					<input type="radio"name="stuChoose">党员
  				</td>
  			</tr>
  			<tr><td><input type="submit" value="录入信息"></td><td><input type="reset" value="取消录入"></td></tr>
  			</table>
  		</form>
  </body>
</html>
