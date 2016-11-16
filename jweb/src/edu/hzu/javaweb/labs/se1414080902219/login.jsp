<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">

    <title>My JSP 'login.jsp' starting page</title>


  </head>

  <body>
    <fieldset>
    <legend>用户登录</legend>
    <div align="center">
    <form action="loginServlet" method="post" >
    <div>账号：
    <input type="text" name="userName"/>
    </div>
     <div>密码：
    <input type="text" name="password"/>
    </div>
    <div>
    <input type="submit" value="登陆"/>
    </div>
    </form>
    </div>
    </fieldset>
  </body>
</html>
