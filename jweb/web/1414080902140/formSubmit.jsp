<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <style>
 div{ 
   width:1300px;  
   height:200px;  
   position:absolute;  
   left:50%;  
   top:50%;  
   margin:-100px 0 0 -150px 
} 
  
  </style>

    <base href="<%=basePath%>">
    <title>体侧信息提交页面</title>
  </head>
  <body>
    <c:if test="${username != null}">
       <c:out value="${username}"/>您好
    </c:if> 
     <div>
   <h3>添加学生体侧信息</h3>  
   
    <form action="SubmitServlet" method="post">
        学号<input type="text" name="sno"><br>
        姓名<input type="text" name="name"><br>
        性别<input type="checkbox" name="sex" value="男">男&nbsp;
     <input type="checkbox" name="sex" value="女">女<br>
        年龄<input type="text" name="age"><br>
        身高<input type="text" name="hight"><br>
        体重<input type="text" name="weight"><br>
       长跑<input type="text" name="longRun"><br>
        短跑<input type="text" name="shortRun"><br>
       肺活量<input type="text" name="pulmonary"><br>
        
     <input type="submit" value="提交">&nbsp;<input type="reset" value="重置">
</form>
</div>
  </body>
</html>
