package edu.hzu.javaweb.labs.se1414080902106.myJavaBeans;

import java.sql.*;
import java.text.SimpleDateFormat;

public abstract class MyJavaBean implements MyJavaBeanInterface {
  public int[] in;		//用来表示接下来执行SQL操作时使用哪些属性作为输入
  public int[] out;		//用来表示接下来执行SQL操作时使用哪些属性作为输出
  public final String myDFS = "yyyy-MM-dd HH:mm:ss"; //时间格式字符串

  //格式化DateTime
  final public String formatDT(Date datetime) {
    SimpleDateFormat sdf = new SimpleDateFormat(myDFS);
    return sdf.format(datetime);
  }

  public final Connection getDBConnection() throws InstantiationException,
  IllegalAccessException, ClassNotFoundException, SQLException {
    //装载驱动程序
    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
    //连接字符串
    String url ="jdbc:sqlserver://localhost:1433;DatabaseName=CMSDB";
    //建立连接
    Connection con = DriverManager.getConnection(url, "me", "me");
    return con;
  }

  public final void closeDB(Connection con, CallableStatement call, ResultSet rs) throws SQLException {
    //关闭结果集
    if (rs != null)
      rs.close();
    //关闭操作对象
    if (call != null)
      call.close();
    //关闭连接
    if (con != null)
      con.close();
  }
  public final void closeDB(Connection con, PreparedStatement ps, ResultSet rs) throws SQLException {
    //关闭结果集
    if (rs != null)
      rs.close();
    //关闭操作对象
    if (ps != null)
      ps.close();
    //关闭连接
    if (con != null)
      con.close();
  }
  public final void closeDB(Connection con, Statement stmt, ResultSet rs) throws SQLException {
    //关闭结果集
    if (rs != null)
      rs.close();
    //关闭操作对象
    if (stmt != null)
      stmt.close();
    //关闭连接
    if (con != null)
      con.close();
  }
}
