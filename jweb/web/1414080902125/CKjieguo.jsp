<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page  import="java.sql.*" %>
<%@ page import="javax.sql.*"%>
<%@ page  import="javax.naming.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>查看结果</title>

  </head>
  
  <body>
   
 <%
 
    int id=Integer.parseInt(request.getParameter("id"));
 
    DataSource ds=null;
    Connection conn=null;
    PreparedStatement pstmt=null;
    ResultSet rs=null;

    try{
        InitialContext ctx=new InitialContext();
        ds=(DataSource)ctx.lookup("java:comp/env/jdbc/mysql");
        conn=ds.getConnection();
        String sql="select job from student where id=?";
        pstmt=conn.prepareStatement(sql);
        pstmt.setInt(1,id);
        rs=pstmt.executeQuery();
        rs.first();%>
        
       <p align="center"><%=id %>的作业情况：</p>
       <p align="center"><%=rs.getString("job") %>  </p>
      
 <% }catch(Exception e){%>
        <%=e.getMessage() %>
 <% }
    finally{
        if(rs!=null){rs.close();}
        if(pstmt!=null){pstmt.close();}
        if(conn!=null){conn.close();}
    }
     %>
   
  </body>
</html>
