package JDBC_package;
import java.sql.*;


import com.mysql.jdbc.PreparedStatement;
public class JDBC_package {
	private static Connection conn=null;
	private static String url;
	private static int sql_result;
	public static ResultSet result =null;
	public static Statement stmt = null;
	public static void getstmt() throws SQLException
	{
		stmt = conn.createStatement();
	}
	
	public static void getUrl(String Port,String Database,String Uid,String Pwd)
	{
		url = "jdbc:mysql://localhost:"+Port+"/"+Database+"?user="+Uid+"&password="+Pwd+"&userUnicode=true&charterEncoding=UTF8";
	}
	public static void SqlConnection() throws SQLException
	{
		new com.mysql.jdbc.Driver();
		System.out.println("¼ÓÔØÇý¶¯");
		conn = DriverManager.getConnection(url);
	}
	public static void create_table(String create_table_sql) throws SQLException
	{
		//stmt = conn.createStatement();
		sql_result = stmt.executeUpdate(create_table_sql);
	}
	public static void update_table(String update_table_sql) throws SQLException
	{
		//stmt = conn.createStatement();
		sql_result = stmt.executeUpdate(update_table_sql);
	}
	public static void insert_table(String insert_table_sql) throws SQLException
	{
		//stmt = conn.createStatement();
		sql_result = stmt.executeUpdate(insert_table_sql);
	}
	public static void select_table(String select_table_sql) throws SQLException
	{
		//stmt = conn.createStatement();
		result = stmt.executeQuery(select_table_sql);
	}
	public static void sql_close() throws SQLException
	{
			result.close();
			conn.close();
	}
}
