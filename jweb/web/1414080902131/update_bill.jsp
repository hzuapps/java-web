<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改后重写记录页面</title>
    
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
       String sql="update bill set zno=?,jname=?,money=?,qixian=?,way=?,rate=?,sum=?,state=? where jname=?and state=?";
        pstmt=conn.prepareStatement(sql);
       request.setCharacterEncoding("UTF-8");
       int zno=Integer.parseInt(request.getParameter("zno"));
       String jname2=request.getParameter("jname2");
       int money=Integer.parseInt(request.getParameter("money"));
	   String qixian=request.getParameter("qixian");
	   String way=request.getParameter("way");
       Double rate=Double.parseDouble(request.getParameter("rate"));
       Double sum=Double.parseDouble(request.getParameter("sum"));
	   String state2=request.getParameter("state2");
       String jname=(String)session.getAttribute("jname");
       String state=(String)session.getAttribute("state");
       pstmt.setInt(1,zno);
       pstmt.setString(2,jname2);
       pstmt.setInt(3,money);
       pstmt.setString(4,qixian);
       pstmt.setString(5,way);
       pstmt.setDouble(6,rate);
       pstmt.setDouble(7,sum);
       pstmt.setString(8,state2);
       pstmt.setString(9,jname);
       pstmt.setString(10,state);
       int n=pstmt.executeUpdate();
       if(n>=1){%>数据重写操作成功！<br><%}
       else{%>数据重写操作失败！<br><%}
       }catch(Exception e){%>出现意外，信息是：<%=e.getMessage() %><%} 
       finally{if(pstmt!=null){pstmt.close();}
       if(pstmt!=null){pstmt.close();}
     }%>
  </body>
</html>
