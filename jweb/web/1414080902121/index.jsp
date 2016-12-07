<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登陆</title>
<style>
form{width:350px;height:200px;}  
form fieldset{border:0;align:center;}  
form label{display:inline-block;width:60px;text-align:right}  
input{width:300px;height:35px;}  
#submit{width:200px;height:35px;position:relative;left:60px;}  
#submit:hover{  
        cursor: pointer;  
        background: #FDF5E6;  
    }  
body{  
    width:100%;   
    height:100%;  
    background: #CCDDFF;   
    }  
#box{position:fixed;left:0px;right:0px;width:606px;margin-left:auto;margin-right:auto;top:100px;}   
a{position:relative;bottom:-10px;} 
</style>
</head>
<body>
<div id="box">
<form action="Se1414080902215Servlet" style="background:#F5F5F5  ">
<fieldset> 
  <p>
    <label for="user">用户：</label>
    <input type="text" class="" id="user" name="username" placeholder="user">
<br>
    <label for="password">密码：</label>
    <input type="password" class="" id="password" name="password" placeholder="password">
  <button type="submit" id="submit">登录</button>
  </fieldset>
</form>
</div>
</body>
<c:if test="${!empty sessionScope.message}">
<c:out value="${sessionScope.message}"></c:out>
</c:if>
</html>