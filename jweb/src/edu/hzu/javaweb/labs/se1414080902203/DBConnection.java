package edu.hzu.javaweb.labs.se1414080902203;

import java.sql.*;

public class DBConnection {
	private static String driverName="com.mysql.jdbc.Driver";
	private static String userName="root";
	private static String userPwd="";
	private static String dbName="Register";
	
	public static Connection getDBconnection()
	{
		String url1="jdbc:mysql://localhost/"+dbName;
		String url2="?user="+userName+"&password="+userPwd;
		String url3="&useUnicode=true&characterEncoding=UTF-8";
		String url=url1+url2+url3;
		try{
			Class.forName(driverName);
			Connection con=DriverManager.getConnection(url);
			
			return con;
		}catch(Exception e)
			{e.printStackTrace();
			
		}
		return null;
	}
	
	public static void closeDB(Connection con,PreparedStatement pstmt,ResultSet rs){
		try{
			if(rs!=null) rs.close();
			if(pstmt!=null)pstmt.close();
			if(con!=null)con.close();
		}catch(SQLException e){e.printStackTrace();}
	}
}
