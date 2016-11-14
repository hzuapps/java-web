<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'CreateInfo.jsp' starting page</title>
    
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
    <form action="Check" method="post">
                             厂商          ：<input type="text" name="manufacturers"><br>
                             级别          ：<input type="text" name="level"><br>
                         发动机          ：<input type="text" name="engine"><br>
                         变速箱          ：<input type="text" name="gearbox"><br>
         长*宽*高(mm)    ：<input type="text" name="size"><br>
                    车身结构           ： <input type="text" name="body"><br>
     最高车速(km/h)    ：<input type="text" name="maxspeed"><br>
     官方0-100km/h加速(s)：<input type="text" name="hundred"><br>
     工信部综合油耗(L/100km)：<input type="text" name="gas"><br>
         <input type="submit"  value="提交">
         <input type="reset"   value="重置">  
    </form>
  </body>
</html>
