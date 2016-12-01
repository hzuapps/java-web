<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<title>在线作业提交系统</title>
</head>
<body>

    <h2 align="center">在线作业提交系统</h2>
    
    <form action="Function.jsp" method="post">
    <table align="center">
    <tr>
              <td align="right">学号:*</td><td><input type="text" name="id"></td>
    </tr>
    
    <tr>
             <td align="right">密码:*</td><td><input type="password" name="pw"></td>
    </tr>

    <tr>
            <td  colspan="3" align="center"  height="40">
                    <input  type="submit" value="登录" >&nbsp;
                    <input   type="reset" value="取消">
           </td>
    </tr>
    
    
     <tr>
              <td>当前时间：</td>
		      <td align="center">
		      <%
		       Date date=new Date();
		       session.setAttribute("time",date);  
		     %>
		     <c:out value="${sessionScope.time}"></c:out>
		     </td>
	</tr>
    </table>
    </form>

</body>
</html>
