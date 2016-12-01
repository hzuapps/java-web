package bean;

import java.sql.*;

public class JDBC {
	private String url = "jdbc:mysql://localhost:3306/test?user=root&password=&useUnicode=true&characterEncoding=UTF8";
	private Connection conn;
	private String sql;
	private Statement stmt;
	private ResultSet Rs;
	private int rs;
	public void getConnection() throws SQLException
	{
		new com.mysql.jdbc.Driver();
		conn = DriverManager.getConnection(url);
	}
	
	
	public ResultSet setQuery(String sql) throws SQLException
	{		//≤È—Ø
		stmt = conn.createStatement();
		this.sql = sql;
		Rs = stmt.executeQuery(sql);
		return Rs;
	}
	
	public void setUpdate(String sql) throws SQLException
	{
		stmt=conn.createStatement();
		this.sql = sql;
		rs = stmt.executeUpdate(sql);
	}
}
