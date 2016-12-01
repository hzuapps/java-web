<%@ page language="java" import="java.util.*,test.Student"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>提交的数据</title>
 </head>
  <body>
      <c:if test="${username != null}">
       <c:out value="${username}"/>您好
    </c:if> 
     <h2>您提交的内容如下：</h2>
     <% request.setCharacterEncoding("utf-8");%>
     <c:forEach var="student" items="${result}">
     <ul>
        <li> 学号： ${student.sno}</li> 
        <li> 姓名： ${student.name}</li>
        <li> 年龄：${student.age}</li>
        <li> 性别: ${student.sex}</li>
        <li> 身高：  ${student.hight}</li>
        <li> 体重：  ${student.weight}</li>
        <li> 长跑：  ${student.longRun}</li>
        <li> 短跑   ${student.shortRun}</li>
        <li>肺活量： ${student.pulmonary} </li>
     </ul>
     </c:forEach>  
   </body>
</html>
