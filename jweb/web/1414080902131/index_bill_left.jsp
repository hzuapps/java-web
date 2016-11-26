<%@ page language="java" import="java.util.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>菜单页面</title>
    
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
    <br><br><br><br><br><br>
    <p><a href="showall.jsp"target="right">列出全部借款账单</a></p>
     <p><a href="query_bill_tijiao.jsp"target="right">查询借款账单状态</a></p>
     <p><a href="insert_bill_tijiao.jsp"target="right">新添加借款账单</a></p>
     <p><a href="delete_bill_tijiao.jsp"target="right">按条件删除借款账单</a></p>
      <p><a href="update_bill_tijiao.jsp"target="right">按条件修改借款账单</a></p>
  </body>
</html>
