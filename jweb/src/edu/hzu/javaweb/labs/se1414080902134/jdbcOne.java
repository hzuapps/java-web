package edu.hzu.javaweb.labs.se1414080902134;

import java.sql.*;
import java.util.*;


public class jdbcOne {
	private static String driver;
	private static String url;
	private static String user;
	private static String pwd;
	//private static Properties pt = new Properties();
	public jdbcOne(){}
	static {
		try {
			//pt.load(jdbcOne.class.getClassLoader()
			//		.getResourceAsStream("db.properties"));
			driver = "com.mysql.jdbc.Driver";//pt.getProperty("driver");
			url = "jdbc:mysql://localhost:3306/my_db?userUnicode=true&charcterEncoding=utf-8";//pt.getProperty("url");
			user = "root";//pt.getProperty("user");
			pwd = "include bing";//pt.getProperty("pwd");
			Class.forName(driver);
		} catch (Exception e) {
			throw new ExceptionInInitializerError(e);
		}
	}
	
	public static Connection getConnection() throws SQLException{
		return (Connection) DriverManager.getConnection(url,user,pwd);
	}
	
	public static void free(ResultSet rs,Statement ps,java.sql.Connection conn) {
		try {
			if (rs != null) {
				rs.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null) {
					ps.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				if (conn != null) {
					try {
						conn.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
		}
	}
}
