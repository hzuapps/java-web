+package edu.hzu.javaweb.labs.se1413071001206;
 +
 +import java.sql.Connection;
 +import java.sql.DriverManager;
 +import java.sql.PreparedStatement;
 +import java.sql.ResultSet;
 +import java.sql.SQLException;
 +
 +public class DBConnect {
 +	public static Connection getDBconnection(){
 +		String url=jdbcsqlitedtest.db;���ݿ��ַ
 +		String  driverName =org.sqlite.JDBC;����������
 +		try{
 +		    Class.forName(driverName);
 +		    Connection con=DriverManager.getConnection(url); 
 +		    return con; 
 +	    }catch (Exception e) {
 +			   e.printStackTrace();
 +		}
 +		return null;
 +    } 
 +    public static void closeDB(Connection con,PreparedStatement pstm, ResultSet rs){
 + 	   try{
 + 		   if(rs!=null) rs.close(); 
 + 		   if(pstm!=null) pstm.close();
 +		   if(con!=null) con.close();
 +	   }catch (SQLException e) {
 +			e.printStackTrace();
 +	   }
 +	}
 +} 