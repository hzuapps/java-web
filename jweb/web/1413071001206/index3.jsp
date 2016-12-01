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
<form action="Se1413071001206Servlet" style="background:#cccccc">
  请输入借伞的价钱：<input type="text" name="money">
    请输入您的位置：<input type="text" name="address">
</form>
</div>

</body>
<c:out value="${sessionScope.money}"></c:out>
<c:out value="${sessionScope.address}"></c:out>
</html>