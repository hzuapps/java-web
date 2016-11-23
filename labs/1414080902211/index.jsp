<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>main.jsp</title>
    
  <meta http-equiv="pragma" content="no-cache">
  <meta http-equiv="cache-control" content="no-cache">
  <meta http-equiv="expires" content="0">    
  <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
  <meta http-equiv="description" content="This is my page">
  <!--
  <link rel="stylesheet" type="text/css" href="styles.css">
  -->
  <style type="text/css">

  body{
 
    font-family: 'Microsoft YaHei';
  }

  h1{
    font-size: 45px;
    height:60px;
    padding-top:20px;
  }
  span{
    float:right;
    margin-right: 20px;
   font-size: 25px;   
  }
  button{
     width: 370px;
     height: 45px;
      margin-left: 190px;
      margin-top:10px;
      border-radius: 20px;
      background: -webkit-gradient(linear, 0 0, 0 100%, from(#6BD9D4), to(#4BBFA5));
     color: white;
     font-size: 28px;
     outline: none;
     margin-top: 40px;
   }
  hr{
    margin-bottom: 50px;
  }
  </style>
  </head>
  
  <body>
   <h1 align="center">Welcome to the main page!</h1>
   <%
    Calendar rightNow = Calendar.getInstance();
    Integer Hour=new Integer(rightNow.get(Calendar.HOUR_OF_DAY));
    request.setAttribute("hour", Hour);
   %>
   <c:choose>
     <c:when test="${ hour >= 0 && hour <= 11}"><span>Good morning, <c:out value="${param.username}" default="user"/>!</span></c:when>
     <c:when test="${ hour >= 12 && hour <= 17}"><span>Good afernoon, <c:out value="${param.username}" default="user"/>!</span></c:when>
     <c:otherwise><span>Good night, <c:out value="${param.username}" default="user"/>!</span></c:otherwise>
   </c:choose>
  <hr width="100%" size="2">
  <%
    String driverName = "com.mysql.jdbc.Driver";   //驱动程序名
    String userName = "root";                    //数据库用户名
    String userPwd = "123456";                  //密码
    String dbName = "myweb"; 
    String  url1="jdbc:mysql://localhost/"+dbName;
    String  url2 ="?user="+userName+"&password="+userPwd;
    String  url3="&useUnicode=true&characterEncoding=utf-8";
    String  url =url1+url2+url3;
    Class.forName(driverName);
    Connection con=DriverManager.getConnection(url); 
    PreparedStatement prepStmt =  con.prepareStatement("select name from home_furnishing_info");
    ResultSet rs = prepStmt.executeQuery();
        while(rs.next()) {
          %><button><%=rs.getString(1) %></button>
      <%}
    if(rs!=null) rs.close(); 
    if(prepStmt!=null) prepStmt.close();
    if(con!=null) con.close();
   %>
</form>
  </body>
</html>
