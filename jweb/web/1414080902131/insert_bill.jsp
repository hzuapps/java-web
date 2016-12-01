<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>利用PreparedStatement对象添加一条记录页面</title>
    
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
       String sql="Insert into bill(zno,jname,money,qixian,rate,sum,way,state)value(?,?,?,?,?,?,?,?)";
       pstmt=conn.prepareStatement(sql);
       request.setCharacterEncoding("UTF-8");
       int zno=Integer.parseInt(request.getParameter("zno"));
       String jname=request.getParameter("jname");
	   int money=Integer.parseInt(request.getParameter("money"));
	   String qixian=request.getParameter("qixian");
       Double rate=Double.parseDouble(request.getParameter("rate"));
       Double sum=Double.parseDouble(request.getParameter("sum"));
       String way=request.getParameter("way");
	   String state=request.getParameter("state");
       pstmt.setInt(1,zno);
       pstmt.setString(2,jname);
       pstmt.setInt(3,money);
       pstmt.setString(4,qixian);
       pstmt.setDouble(5,rate);
       pstmt.setDouble(6,sum);
	   pstmt.setString(7,way);
       pstmt.setString(8,state);
       int n=pstmt.executeUpdate();
       if(n==1){%>数据插入操作成功！<br><%}
       else{%>数据插入操作失败！<br><%}
       }catch(Exception e){%>出现意外，信息是：<%=e.getMessage() %><%} 
       finally{if(pstmt!=null){pstmt.close();}
       if(pstmt!=null){pstmt.close();}
     }%>
  </body>
</html>
