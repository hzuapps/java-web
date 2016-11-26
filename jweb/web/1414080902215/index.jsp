<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户登录</title>
<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
<style>
form{padding:20px 15px 0px 40px;}  
form{width:400px;height:300px;}  
form fieldset{border:0;align:center;}  
form label{display:inline-block;width:60px;text-align:right}  
input{width:240px;height:30px;}  
#submit{width:200px;height:35px;position:relative;left:70px;}  
#submit:hover{  
        cursor: pointer;  
        background:#D8D8D8;  
    }  
body{  
    width:100%;   
    height:100%;  
    background: #E9E9E9;   
    }  
#box{position:fixed;left:0px;right:0px;width:606px;margin-left:auto;margin-right:auto;top:100px;}   
a{position:relative;bottom:-10px;} 
</style>
</head>
<body>
<div id="box">
<form action="Se1414080902215Servlet" style="background:#cccccc">
<fieldset> 

  <p>
    <label for="user">用户：</label>
    <input type="text" class="" id="user" name="username" placeholder="user">
  <p>

  <p>
    <label for="password">密码：</label>
    <input type="password" class="" id="password" name="password" placeholder="password">
  <p>
  <br>
  <p>
  <button type="submit" id="submit">登录</button>
  <p>
  <p><a href="register.jsp">注册</a><p>
  </fieldset>
</form>
</div>

</body>
<c:if test="${!empty sessionScope.message}">
<c:out value="${sessionScope.message}"></c:out>
</c:if>
</html>