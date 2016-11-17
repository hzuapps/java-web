package Bean;

import java.sql.*;
import java.util.*;

public class JDBC {
	private String url;
	private Connection conn = null;
	private ResultSet Result;
	private int result;
	private String query;
	private String update;
	private Statement stmt;
	private String account;
	private String password;
	private String name;
	
	public String getUrl() {
		url = "jdbc:mysql://localhost:3306/test?user=root&password=&userUnicode=true&charterEncoding=UTF-8";
		return url;
	}

	public Connection getConn() throws SQLException { 
		new com.mysql.jdbc.Driver();
		conn = DriverManager.getConnection(url);
		return conn;
	}

	public void getResult() throws SQLException {
		while(Result.next())
		{
			account = Result.getString("account");
			password = Result.getString("password");
			name = Result.getString("name");
		}
	}

	public int getresult() {
		return result;
	}

	public void setstmt() throws SQLException
	{
		stmt = conn.createStatement();
	}
	public void setQuery(String account,String password)
	{
		query = String.format("select * from user where account ='%s' or name = '%s'",account,name);
	}
	public void getQuery() throws SQLException
	{
		Result = stmt.executeQuery(query);
	}
	public String getAccount()
	{
		return account;
	}
	public String getPassword()
	{
		return password;
	}
	public String getName()
	{
		return name;
	}
	
	public void getUpdate() throws SQLException
	{
		result = stmt.executeUpdate(update);
	}
	public void Query(String sql) throws SQLException
	{
		Result = stmt.executeQuery(sql);
	}
	public void Update(String sql) throws SQLException 
	{
		result = stmt.executeUpdate(sql);
	}
	public void getclose() throws SQLException
	{
		conn.close();
	}
}
