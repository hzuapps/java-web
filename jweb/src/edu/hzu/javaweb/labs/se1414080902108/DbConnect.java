package edu.hzu.javaweb.labs.se1414080902108;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DbConnect {
	private static String driverName = "com.mysql.jdbc.Driver";
	private static String userName = "root";
	private static String userPwd = "";
	private static String dbName = "jweb";

	public static Connection getDBconnection() {
		String url1 = "jdbc:mysql://localhost:3306/" + dbName;
		String url2 = "?user=" + userName + "&password=" + userPwd;
		String url3 = "&useUnicode=true&characterEncoding=utf-8&useSSL=false";
		String url = url1 + url2 + url3;
		try {
			Class.forName(driverName);
			Connection conn = DriverManager.getConnection(url);
			return conn;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public static void closeDB(Connection con, PreparedStatement pstm,
			ResultSet rs) {
		try {
			if (rs != null)
				rs.close();
			if (pstm != null)
				pstm.close();
			if (con != null)
				con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
