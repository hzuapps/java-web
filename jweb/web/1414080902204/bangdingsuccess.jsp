<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ page import="java.util.Date" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML >
<html>
  <head> 
    <title>My JSP 'success.jsp' starting page</title>
    <meta http-equiv="content-type" content="text/html"/>
    <style type="text/css">
    p{color:blue;text-decoration: underline;font-size: 15px; }
    </style> 
  </head>  
  <body>
  <%     Calendar cal = Calendar.getInstance();
	    int year = cal.get(Calendar.YEAR);//获取年份
        int month=cal.get(Calendar.MONTH);//获取月份
        int day=cal.get(Calendar.DATE);//获取日
        int hour=cal.get(Calendar.HOUR);//小时
        int minute=cal.get(Calendar.MINUTE);//分           
        int second=cal.get(Calendar.SECOND);//秒
  	response.setCharacterEncoding("UTF-8");
  %>
  尊敬的：<p><%=request.getParameter("Username") %></p>您于<%=year %>年<%=month+1 %>月<%=day %>日<%=hour%>时<%=minute %>分
  <%=second %>秒，成功开通手机深圳通业务，
  请持有效身份证前往营业厅领取您的专属SIM卡，并进行实名认证，感谢你对深圳通的支持！
  </body>
</html>
