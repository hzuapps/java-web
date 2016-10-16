<%@ page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>显示所有借款账单的页面</title>
    
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
    <center>
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
       try{Class.forName(driverName);
        conn=DriverManager.getConnection(url);
           String sql="select * from bill";
            pstmt=conn.prepareStatement(sql);
           rs=pstmt.executeQuery();
           rs.last();
     %>你要查询的借款账单中共有
     <font size="5"color="red"><%=rs.getRow() %></font>单
     <table border="2"bgcolor="ccceee"width="650">
     <tr bgcolor="CCCCCC"align="center">
     <td>记录条数</td><td>账单号</td><td>借款人</td>
     <td>借款数目</td><td>借款期限</td><td>利率</td><td>还款总额</td><td>还款方式</td><td>状态</td>
     </tr>
     <% rs.beforeFirst();
        while(rs.next()){
     %> <tr align="center">
        <td><%=rs.getRow() %></td>
        <td><%=rs.getString("zno") %></td>
        <td><%=rs.getString("jname") %></td>
        <td><%=rs.getString("money") %></td>
        <td><%=rs.getString("qixian") %></td>
        <td><%=rs.getString("rate") %></td>
        <td><%=rs.getString("sum") %></td>
		<td><%=rs.getString("way") %></td>
		<td><%=rs.getString("state") %></td>
        </tr>
        <%} %>
     </table>
     </center>
     <%}catch(Exception e){%>出现意外，信息是：<%=e.getMessage() %>
     <%}
     finally{
    if(rs!=null){rs.close();}
      if(pstmt!=null){pstmt.close();}
      if(conn!=null){conn.close();}
     }%>
  </body>
</html>
