package edu.hzu.javaweb.labs.se1414080902110;

import java.sql.*;

public class JDBCconnection {
	public Connection connection() {
		String driverName = "com.mysql.jdbc.Driver";
		String userName = "root";
		String userpwd = "123456";
		String dbName = "musicforum";
		String url1 = "jdbc:mysql://localhost:3306/" + dbName;
		String url2 = "?user=" + userName + "&password=" + userpwd;
		String url3 = "&useUnicode=true&characterEncoding=UTF-8";
		String url = url1 + url2 + url3;
		try {
			Class.forName(driverName);
		} catch (ClassNotFoundException driver) {
			driver.printStackTrace();
		}
		try {
			Connection connection = DriverManager.getConnection(url);
			return connection;
		} catch (SQLException sql) {
			sql.printStackTrace();
		}
		return null;
	}
}
