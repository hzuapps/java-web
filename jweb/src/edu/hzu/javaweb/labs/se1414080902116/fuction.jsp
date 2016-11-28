<%@ page language="java" import="java.util.*" pageEncoding="utf8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
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
 
    <h4 align="center" style=color:blue; ></4></br>
    <%String str1 =request.getParameter("username"); 
    String str2 =request.getParameter("userpwd"); 
    String fuction="";
		if("abc".equals(str1)&&"123".equals(str2))
			{fuction="欢迎你,"+str1+",登录房租管理系统! ";
			out.print(fuction);
		
			
			}
			
			 else { fuction="用户名不正确,请输入正确的信息!" ;
			out.print(fuction);%>
			<jsp:forward page="/loginerror.jsp" >
				<jsp:param value="1" name="error"/>
			</jsp:forward>
			
			<%}

     %>
  
     </h4>
    <centre color="blue">选择你需要的功能：</br>
    
			<c:forEach var="item" items="1.管理已经出租的房间,2.增加新租客的信息,3.查看XXX房间的水电消费情况。,4.发布最新租房信息" 
		begin="0"	 end="4" step="1" > 
		<if test="${ item}">
		<c:out value="${ item}"/></br>
		</if>
			</c:forEach></br>
   <a href="see.jsp"> 1.fuction</a></br></br>
  

   <a href="add1.jsp"> 2.fuction</br></br>
    
    
            
    <a href="xxx1.jsp"> 3.fuction</a></br></br>
      
     
              
   <a href="putfoward.jsp"> 4.fuction</br></br>
    


  </body>
</html>