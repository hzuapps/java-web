<%@ page language="java" import="java.sql.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">

    <title>PersonMessageModifyPage</title>
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css"/>
  </head>

  <body>

    <%
    String driverName="com.mysql.jdbc.Driver";
    String UserName="root";
    String userPwd="";
    String dbName="thesis";
    String url1="jdbc:mysql://localhost:3306/"+dbName;
    String url2="?user="+UserName+"&password="+userPwd;
    String url3="&useUnicode=true&characterEncoding=utf-8";
    String url=url1+url2+url3;
    Class.forName(driverName);
    Connection conn=DriverManager.getConnection(url);
    String sql="select * from personmessage where userName=?";
    PreparedStatement pstmt=conn.prepareStatement(sql);
    request.setCharacterEncoding("utf-8");
    String userName=session.getAttribute("userName").toString();

    pstmt.setString(1,userName);

    try
    {
    	ResultSet r=pstmt.executeQuery();
    	if(r.next())
    	{
    		String user=r.getString("userName");
    		String age=r.getString("age");
    		String profession=r.getString("profession");
    		String className=r.getString("className");
    		%>

        <div class="panel panel-success">
        <div class="panel-heading text-center"><h2>修改个人信息</h2></div>
        <div class="panel-body">
            <form id="formid" action="updatePersonMessage.jsp" method="post">
            <div class="form-group">
                <label>你的姓名：</label><input type="text" class="form-control" name="user" value=<%=user %> readonly />
            </div>
            <div class="form-group">
                <label>你的年龄：</label><input type="text" class="form-control" name="age" placeholder=<%=age %> />
            </div>
            <div class="form-group">
                <label>你的专业：</label><input type="text" class="form-control" name="profession" placeholder=<%=profession %> />
            </div>
            <div class="form-group">
                <label>你的班级：</label><input type="text" class="form-control" name="className" placeholder=<%=className %> />
            </div>
            <div class="text-center">
            <input type="submit" class="btn btn-success" value="确定修改信息"  />
            </div>
            </form>
        </div>
        </div>



    		<%
    	}
    }catch(Exception e)
    {
    	e.printStackTrace();
    }

     %>



  </body>
</html>
