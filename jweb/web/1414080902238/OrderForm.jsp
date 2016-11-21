<%@ page contentType="text/html" pageEncoding="utf-8" import="java.sql.*"%>
<html>
	<head><title>显示所有订单的页面</title></head>
	<body>
		
			<%
				String driverName="com.mysql.jdbc.Driver";
				String userName="root";
				String userPwd="root";
				String dbName="cars";
				String url1="jdbc:mysql:/localhost:3306/"+dbName;
				String url2="?user="+userName+"&password="+userPwd;
				String url3="&userUnicode=true&characterEncoding=UTF-8";
				String url=url1+url2+url3;
				Class.forName(driverName);
				Connection conn=DriverManager.getConnection(url);
			 %>
			 
			 <%
			 	String sql="select * from car_order";
			 	PreparedStatement pstmt=conn.prepareStatement(sql);
			 	ResultSet rs=pstmt.executeQuery();
			 	rs.last();
			  %>目前所有的客户订单共有：
			  <font size="4"><%=rs.getRow() %></font>个
			  <table border="2" bgcolor="ccceee" width="650">
			  	<tr bgcolor="CCCCCC">
			  		<td>纪录条数</td><td>客户姓名</td><td>电话号码</td><td>所购车辆</td><td>是否已付款</td>
			  		</tr>
			  	<% rs.beforeFirst();
			  		while(rs.next()){
			  	 %>
			  	 <tr>
			  	 	<td><%=rs.getRow() %></td>
			  	 	<td><%=rs.getString("clientName") %></td>
			  	 	<td><%=rs.getString("phone") %></td>
			  	 	<td><%=rs.getString("car") %></td>
			  	 	<td><%=rs.getBoolean("isPay") %></td>
			  	 </tr>
			  	 <% } %>
			 </table>
		</center>
		<%
			if(rs!=null){rs.close();}
			if(pstmt!=null){pstmt.close();}
			if(conn!=null){conn.close();}
		 %>
	
	</body>
</html>