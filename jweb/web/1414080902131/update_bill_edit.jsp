<%@ page language="java" import="java.sql.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改编辑页面</title>
    
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
   <%  Connection conn=null;
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
       session.setAttribute("jname",jname);
       session.setAttribute("state",state);
       String sql="select * from bill where jname=?and state=?";
       pstmt=conn.prepareStatement(sql);
       pstmt.setString(1,jname);
       pstmt.setString(2,state);
       rs=pstmt.executeQuery();
       if(rs.next()){
       int zno=rs.getInt("zno");
       String jname2=rs.getString("jname");
       int money=rs.getInt("money");
	   String qixian=rs.getString("qixian");
	   String way=rs.getString("way");
       double rate=rs.getDouble("rate");
       double sum=rs.getDouble("sum");
       String state2=rs.getString("state");
       if(rs!=null){rs.close();}
       if(pstmt!=null){pstmt.close();}
       if(conn!=null){conn.close();}
       %>
       <form action="update_bill.jsp" method="post">
       <table border="0"width="238"height="252">
       <tr><td>账单号</td><td><input name="zno"value=<%=zno%>></td></tr>
       <tr><td>借款人</td><td><input name="jname2"value=<%=jname2 %>></td></tr>
       <tr><td>借款数目</td><td><input name="money"value=<%=money %>></td></tr>
       <tr><td>借款期限</td><td><input name="qixian"value=<%=qixian %>></td></tr>
       <tr><td>还款方式</td><td><input name="way"value=<%=way%>></td></tr>
       <tr><td>利率</td><td><input name="rate"value=<%=rate%>></td></tr>
	    <tr><td>还款总额</td><td><input name="sum"value=<%=sum%>></td></tr>
       <tr><td>状态</td><td><input name="state2"value=<%=state2%>></td></tr>
       <tr align="center">
       <td colspan="2">
       <input type="submit"value="提交">&nbsp;&nbsp;&nbsp;&nbsp;
       <input type="reset"value="取消">
       </td>
       </tr>
       </table>
       </form>
       <%}
       else{%>
       没有找到合适条件的记录！！
       <%}
       }catch (Exception e){%>出现意外，信息是：<%=e.getMessage() %><%}
       finally{
       if(rs!=null){rs.close();}
       if(pstmt!=null){pstmt.close();}
       if(conn!=null){conn.close();}
       }%>
       
  </body>
</html>
