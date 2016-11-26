<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>利用提交条件删除记录页面</title>
    
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
     <% Connection conn=null;
       PreparedStatement pstmt=null;
       ResultSet rs=null;
       String driverName="com.mysql.jdbc.Driver";
       String userName="root";
       String userPwd="653975";
       String dbName="bees";
       String url1="jdbc:mysql://localhost:3306/"+dbName;
       String url2="?user="+userName+"&password="+userPwd;
       String url3="&useUnicode=true&characterEncoding=UTF-8";
       String url=url1+url2+url3;
       request.setCharacterEncoding("UTF-8");
       try{
       Class.forName(driverName);
       conn=DriverManager.getConnection(url);
       String jname=request.getParameter("jname");
       String state=request.getParameter("state");
      
       String sql="delete from bill where jname=? and state=?";
       pstmt=conn.prepareStatement(sql);
       pstmt.setString(1,jname);
       pstmt.setString(2,state);
      
       
       int n=pstmt.executeUpdate();
       if(n>=1){%>删除数据操作成功！<br><%}
       else{%>删除数据操作失败！<%=n %><br><%}
       }catch(Exception e){%>出现意外，信息是：<%=e.getMessage() %><%}
       finally{
       if(pstmt!=null){pstmt.close();}
       if(conn!=null){conn.close();}
       }%>
  </body>
</html>
