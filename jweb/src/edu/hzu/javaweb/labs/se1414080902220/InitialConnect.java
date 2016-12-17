package edu.hzu.javaweb.labs.se1414080902220;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class InitialConnect {
	private static String driver ;
	private static String url ;
	private static String user ;
	private static String password ;
	
	private static Properties pr=new Properties(); 
	public InitialConnect()
	{
		
	}
	
	static 
	{ 
		   try {
			  pr.load(InitialConnect.class.getClassLoader().getResourceAsStream("db.properties"));
			  driver=pr.getProperty("driver");
			  url=pr.getProperty("url");
			  user=pr.getProperty("username");
			  password=pr.getProperty("password");
			  Class.forName(driver);
			} catch (Exception e) 
			{
				throw new ExceptionInInitializerError(e);
			}
	}
	
	public static Connection getConnection() throws SQLException 
	{
		return DriverManager.getConnection(url, user, password);
	}
	
	
	public static void free(ResultSet rs, Statement st, Connection conn) 
	{
		try 
		{ 
			if (rs != null) 
				rs.close();
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		} 
		finally 
		{
			try 
			{ 
				if (st != null) 
					st.close();
			} 
			catch (SQLException e) 
			{
				e.printStackTrace();
			} 
			finally
			{
				  if (conn != null)
				    try 
				  	{ 
				    	conn.close();
				    } 
				  	catch (SQLException e)
				  	{
				  		e.printStackTrace();
				  	}
		     }
		}
	}
	
	
	
	
}
