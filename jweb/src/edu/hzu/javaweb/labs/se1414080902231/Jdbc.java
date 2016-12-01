package edu.hzu.javaweb.labs.se1414080902231;

import java.sql.*;

public class Jdbc {
	private static String driverName=null;
	private static String url=null;
	private static Connection conn=null;
	private Jdbc(){}
	private static void link()
	{
			driverName="com.mysql.jdbc.Driver";
	    	String url1="jdbc:mysql://localhost:3306/Unused";
	    	String url2="?user=root&password=";
	    	String url3="&useUnicode=true&characterEncoding=UTF-8";
	    	url=url1+url2+url3;
	}
	public static Connection getConn()
	{
		link();
		try{
	    	Class.forName(driverName);
	    	conn=DriverManager.getConnection(url);
	    	return conn;

		}catch(Exception e){
			e.printStackTrace();;
		}
		return null;
	}
	public static void free(ResultSet rs,PreparedStatement pst,Connection conn)
	{
		try{
			if(rs!=null) rs.close();
			if(pst!=null) pst.close();
			if(conn!=null) {conn.close();System.out.println("out!!");}
			
		}catch(SQLException e){
			e.printStackTrace();
		}
		
	}
}
