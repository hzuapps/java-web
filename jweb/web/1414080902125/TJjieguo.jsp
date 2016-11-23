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
    
    <title>提交结果</title>
    
  </head>
  
  <body>
   
    <%
    
    int id=Integer.parseInt(session.getAttribute("str").toString());
    request.setCharacterEncoding("UTF-8");
    String job=request.getParameter("job");
    
    DataSource ds=null;
    Connection conn=null;
    PreparedStatement pstmt=null;
    ResultSet rs=null;

    try{
        InitialContext ctx=new InitialContext();
        ds=(DataSource)ctx.lookup("java:comp/env/jdbc/mysql");
        conn=ds.getConnection();
        String sql="insert into student(id,job) value(?,?)";
        pstmt=conn.prepareStatement(sql);
        pstmt.setInt(1,id);
        pstmt.setString(2,job);
        int n=pstmt.executeUpdate();
        if(n==1){%>提交成功<%}    
   }catch(Exception e){%>
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
