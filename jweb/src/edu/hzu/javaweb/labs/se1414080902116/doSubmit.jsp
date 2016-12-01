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
  
  <body><h2>你提交显示的内容如下：</h2>
  <% request.setCharacterEncoding("utf8"); %>
  用户名:${param.name }</br>
  密码：123
  性别:${param.sex }</br>
  电话：${param.regTelephone}</br>
 email:${param.email}</br>
  个人简介:${param.intro}</br>
  <a href="login.jsp">返回登录界面 </a></br>
  <a href="zhuce.jsp">返回注册界面</a>
      </form>
    </body>
</html>