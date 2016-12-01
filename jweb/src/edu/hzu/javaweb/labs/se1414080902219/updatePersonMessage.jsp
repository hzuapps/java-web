<%@ page language="java" import="java.sql.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <meta http-equiv="Refresh" content="3; url=PersonMessageModify.jsp" />
    <title>update Message Person </title>

  </head>

  <body>

    <%
    String age=request.getParameter("age");
    String profession=request.getParameter("profession");
    String className=request.getParameter("className");
    String userName=session.getAttribute("userName").toString();

    String driverName="com.mysql.jdbc.Driver";
    String UserName="root";
    String userPwd="";
    String dbName="thesis";
    String url1="jdbc:mysql://localhost:3306/"+dbName;
    String url2="?user="+UserName+"&password="+userPwd;
    String url3="&useUnicode=true&characterEncoding=utf-8";
    String url=url1+url2+url3;
    Class.forName(driverName);
    Connection conn=DriverManager.getConnection(url);
    String sql="update personmessage set age=?,profession=?,className=? where userName=?";
    PreparedStatement pstmt=conn.prepareStatement(sql);
    request.setCharacterEncoding("utf-8");


    pstmt.setString(1,age);
    pstmt.setString(2,profession);
    pstmt.setString(3,className);
    pstmt.setString(4,userName);

    try
    {
    	int i = pstmt.executeUpdate();
    	if(i==1)
    	{
    		%>
    		<div>修改成功</div>
    		<%

    	}
    	else
    	{
    		%>
    		<div>修改失败</div>
    		<%
    	}

    }catch(Exception e)
    {
    	e.printStackTrace();
    }

     %>





  </body>
</html>
