<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
  <head><title>添加一条订单信息</title></head>
  <body>
  <%String driverName="com.mysql.jdbc.Driver";
    String userName="root";
    String userPwd="123456";
    String url1="jdbc:mysql://localhost:3306/"+dbName;
    String url2="?user="+userName+"&password="+userPwd;
    String url3="&useUnicode=true&characterEncoding=UTF-8";
    String url=url1+url2+url3;
    Class.forName(driverName);
    Connection conn=DriverManager.getConnection(url); 
    String sql="Insert into ca_info(userid,operator,value,number)values(?,?,?,?)";
    PreparedStatement pstmt=conn.prepareStatement(sql);
    request.setCharacterEncoding("UTF-8");
    String userid=request.getParameter("userid");
    String operator=request.getParameter("operator");
    int value=Integer.parseInt(request.getParameter("value"));
    int number=Integer.parseInt(request.getParameter("number"));
    pstmt.setString(1,userid);
    pstmt.setString(2,operator);
    pstmt.setInt(3,value);
    pstmt.setInt(4,number);
    int n=pstmt.executeUpdate();
    if(n==1){%>数据插入操作成功!<br><%}
    else{%>数据插入操作失败!<br><%}
    if(pstmt!=null){pstmt.close();}
    if(conn!=null){conn.close();} %>
  </body>
</html>

