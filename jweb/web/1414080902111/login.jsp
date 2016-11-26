<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<title>游戏账号交易系统</title>
</head>
<body>
    <h2 align="center">游戏账号交易系统</h2>
    <form action="select1.jsp" method="post" name="login">
    <table align="center">
    <tr><td align="right">登录名:*</td><td><input type="text" name="NAME"></td>
    </tr>
    <tr><td align="right">密码:*</td><td><input type="password" name="PW"></td>
    </tr>
    <tr><td align="right">身份:*</td>
           <td>
                  <input type="radio"  name="USER"  value="学生"  />卖家</td>
    </tr>   



     <tr>
           <td>当前时间：</td>
		   <td align="center">
		   <%
		   Date date=new Date();
		  session.setAttribute("d",date);  
		   %>
		   <c:out value="${sessionScope.d}"></c:out>
		   </td>
	</tr>
	
    <tr>
    <td  colspan="3" align="center"  height="40">
        <input  type="submit" value="登录" >&nbsp;
        <input   type="reset" value="取消">
    </td>
    </tr>
    
    </table>
    </form>

</body>
</html>