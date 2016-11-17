<%@ page language="java" import="java.util.*" pageEncoding="utf8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
<body><h4 align="center">租房信息发布系统</h4></br>
输入你的姓名：<input type="text" name="uersName"/></br>
输入你的电话联系方式:<input type="text" name="uersphone"/></br>
输入你出租房所在地址：<input type="text" name="uershome"/></br>
选择你所出租的房子类型：</br>
类型：
<select name="select2">
<option select>三房一厅</option>
<option>两房两厅</option>
<option>两房一厅</option>
<option>四房两厅</option>
</br>
输入你出租的类型:<input type="text" name="typeName"/></br>
输入你所出售房子的价格：<input type="text" name="typeprice"/></br>
房子装修的类型：
<select name="select3">
<option select>普通装修</option>
<option>居家精细装修</option>
<option>豪华装修</option>
<option>欧美风格装修</option>
输入你房子装修的类型:<input type="text" name="typedecorate"/></br>
出租房子的楼层：
<select name="select4">
<option select>一楼</option>
<option>二楼</option>
<option>三楼</option>
<option>四楼</option>
<option>五楼</option>
输入你房子楼层:<input type="text" name="type1e"/></br>
房子所拥有家具或者电器：
<td= cospan="2">
<input type="checkbox" name="stucheck">冰箱
<input type="checkbox" name="stucheck">空调
<input type="checkbox" name="stucheck">电视
<input type="checkbox" name="stucheck">沙发
<input type="checkbox" name="stucheck">风扇


房东说明：</br>
<td=colspan="2"><textarea name="letter" rows="8" cols="60"></textarea></br>
<a href="p1.jsp"> 提交并发布所编辑内容</a></br>
<a href="fuction.jsp"> 返回功能界面</a>

   <p>:<%=new Date() %> </p>
  </body>
</html>
