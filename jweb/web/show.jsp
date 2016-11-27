<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'show.jsp' starting page</title>
  </head>
  
  <body>
    
    <%
        String userName=(String)request.getParameter("username");
        String userPwd=(String)request.getParameter("userpwd");
        request.setAttribute("userpwd", userPwd);
     	request.setAttribute("username",userName);
        String dbName="web";
      	String url1="jdbc:mysql://localhost:3306/web";
      	String url2="?user=root&password=";
      	String url3="&useUnicode=true&charsetEncoding=UTF-8";
      	String url=url1+url2+url3;
      	Class.forName("com.mysql.jdbc.Driver");
      	Connection conn=DriverManager.getConnection(url);
    	String sql="select * from user_information";
    	PreparedStatement pstmt=conn.prepareStatement(sql);
    	ResultSet rs=pstmt.executeQuery();
        rs.beforeFirst();
     		while(rs.next()){
     		        if(userName==(String)rs.getString(1)&&(String)userPwd==rs.getString(2))
     		{
     		 session.setAttribute("power1","1");
     		 response.setHeader("Refresh","2;url=main.jsp");
     	    }
     	   
     	                    }
     	    if(rs!=null){rs.close();}
     		if(pstmt!=null){pstmt.close();}
     		if(conn!=null){conn.close();}
      request.getRequestDispatcher("/error.jsp").forward(request, response);
     	 
      	
    %>
  </body>
</html>
