package edu.hzu.javaweb.labs.se1414080902210;

import java.sql.*;


public class DbConnect {
	public static String driverName = "com.mysql.jdbc.Driver";//驱动名称
	public static String userName = "root";//数据库用户名称
	public static String userPwd = "root";//登陆密码
	public static String dbName= "students";//数据库名称

		public static Connection getConnection() {
			String url1 = "jdbc:mysql://localhost:3306/"+dbName;
			String url2 = "?user="+userName+"&password="+userPwd;
			String url3 = "&useUnicode=true&characterEncoding=utf8";
			String url = url1+url2+url3;
			try {
				Class.forName(driverName);
				Connection con = DriverManager.getConnection(url);
				System.out.println("连接成功！");
				return con;
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			return null;
		}
		
		public static void closeDB(Connection con,PreparedStatement pstm,ResultSet rs) {
			try {
				if(rs!=null) rs.close();
				if(pstm!=null)pstm.close();
				if(con!=null) con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
}
