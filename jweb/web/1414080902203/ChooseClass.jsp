<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>选择下载的课程</title>
    
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
    <form method="post" action="Download.jsp">
    	<table align="center" border="0">
    		<tr><td colspan="2" align="left">
    			<h2>数学课程</h2><br>&nbsp;&nbsp;
    			<select size="4" multiple="multiple" name="list1">
    			<option value="高等数学">高等数学</option>
    			<option value="线性代数">线性代数</option>
    			<option value="离散数学">离散数学</option>
    			<option value="概率论">概率论</option>
    			</select><br>
    			<h2>英语课程</h2><br>&nbsp;&nbsp;
    			<select size="4" multiple="multiple" name="list2">
    			<option value="大学英语">大学英语</option>
    			<option value="新概念英语">新概念英语</option>
    			<option value="CET4">四级英语</option>
    			<option value="CET6">六级英语</option>
    			</select><br>
    			<h2>物理课程</h2><br>&nbsp;&nbsp;
    			<select size="4" multiple="multiple" name="list3">
    			<option value="力学">力学</option>
    			<option value="电磁学">电磁学</option>
    			<option value="热学">热学</option>
    			<option value="光学">光学</option>
    			</select><br>
    			<h2>计算机课程</h2><br>&nbsp;&nbsp;
    			<select size="6" multiple="multiple" name="list4">
    			<option value="C">C语言</option>
    			<option value="C++">C++</option>
    			<option value="JAVA">JAVA</option>
    			<option value="数据结构">数据结构</option>
    			<option value="数据库">数据库</option>
    			<option value="操作系统">操作系统</option>
    			</select><br><br>
    			<input type="submit" value="确    定" name="button1">
    			<input type="reset" value="重新选择" name="button2">
    		</td></tr>
    	</table>
    </form>
  </body>
</html>
