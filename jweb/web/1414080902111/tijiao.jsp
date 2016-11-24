<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>发布交易</title>
</head>
<body>
<form action="chakan.jsp" method="post">
<h2 align="center">游戏账号交易</h2>
    
    <table align="center">
    <tr><td>游戏ID或邮箱:</td><td><input type="text" name="Email"></td></tr>
    <tr><td>姓名:</td><td><input type="text" name="Name"></td></tr>
    <tr><td>身份证:</td><td><input type="text" name="ID"></td></tr>
    <tr><td>游戏密码:</td><td><input type="password" name="PW"></td></tr>
    <tr><td>分类:</td>
  		<td><select name="Select">
  		<option selected>英雄联盟</option>
  		<option>地下城与勇士</option>
  		<option>穿越火线</option>
                <option>守望先锋</option>
                <option>其他</option>
  				</select>
  		</td>
  		</tr>
    <tr><td>价格:</td><td><input type="text" name="Money"></td></tr>
    <tr>
    <td>
        <input type="submit" value="提交"onclick="test()"> <input type="reset" value="取消">
    </td>
    </tr>
    </table>
    </form>
</body>
</html>