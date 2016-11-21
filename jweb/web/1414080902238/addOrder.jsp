<%@ page contentType="text/html" pageEncoding="utf-8" import="java.sql.*"%>
<html>
	<head><title>添加订单的页面</title></head>
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
			 	String sql="Insert into car_order(clientName,phone,car,isPay)values(?,?,?,?)";
			 	PreparedStatement pstmt=conn.prepareStatement(sql);
			 	request.setCharacterEncoding("utf-8");
			 	String clientName=request.getParameter("clientName");
			 	String phone=request.getParameter("phone");
			 	String car=request.getParameter("car");
			 	String check=request.getParameter("check");
			 	boolean isPay;
			 	if(check=="已付款")isPay=true;else isPay=false;
			 	
			 	pstmt.setString(1,clientName);
			 	pstmt.setString(2,phone);
			 	pstmt.setString(3,car);
			 	pstmt.setBoolean(4, isPay);
			 	int n=pstmt.executeUpdate();
			 	if(n==1){%>新订单插入成功！<br><%}
			 	else{%>新订单插入失败！<br><%}
			 	if(pstmt!=null){pstmt.close();}
			 	if(conn!=null){conn.close();}%>
	</body>
</html>