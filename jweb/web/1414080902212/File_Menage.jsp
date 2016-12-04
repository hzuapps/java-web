<%@page import="java.util.*, javaBeen.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>文件管理</title>
</head>
<link rel="stylesheet" type="text/css" href="css/File_Manage.css">
<body>
	<div id="head">
		<div id="head_left">
			<a class="title_text" href="">主页</a>
			<a class="title_text" href="">文件</a>
			<a class="title_text" href="My_Main.jsp">上传</a>
			<a class="title_text" href="">(敬请期待)</a>
		</div>
		
		<div id="head_right">
			<img id="head_right_img" src="src/head.png" alt="usrename">
		</div>
		
	</div>
	<div id="content">
		<div id ="list_view">
			<%
			Object oj=request.getAttribute("result");
			List<File>fl=null;
			if(oj instanceof List<?>){
				fl=(List<File>)oj;
			}
			Iterator it = fl.iterator();
			%>
			
			<ul>
				<%
				while(it.hasNext()){
					File f=(File)it.next();
				%>
				<li>
					<a class="fileName" id="a_herf"><%=f.getFileName() %></a>
					 <t class="time" id="time"><%=f.getTime() %></t> <t class="size" id="size7"><%=f.getSize() %></t>
					 <img src="src/download_btn.jpg"> </li>
				<%}%>
			</ul>
		</div>
	</div>
</body>
</html>