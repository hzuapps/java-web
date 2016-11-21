package edu.hzu.javaweb.labs.se1414080902228;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class JDBCUtil {
	private static String url = "jdbc:mysql:///javaweb";  
    private static String className = "com.mysql.jdbc.Driver";  
    private static String user = "root";  
    private static String password = "root";
    
    private static Connection connect = null;
    private static PreparedStatement statement = null;
    private static ResultSet rs = null;
    
    public static Connection getConnection(){
    	if(connect != null)
    		return connect;
    	try {
			Class.forName(className);
			connect = DriverManager.getConnection(url,user,password);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connect;
    }
    
    public static void closeConnection(){
    	try {
			connect.close();
			statement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    
    public List<Product> getProduct(){
    	List<Product> products = new ArrayList();
    	Product product = null;
    	String sql = "select * from product;";
    	try {
    		connect = getConnection();
			statement = (PreparedStatement) connect.prepareStatement(sql);
	    	rs = statement.executeQuery();
	    	if(rs != null){
	    		while(rs.next()){
	    			String id = rs.getString(0);
	    			String name = rs.getString(1);
	    			String date = rs.getString(2);
	    			String decribe = rs.getString(3);
	    			String remarks = rs.getString(4);
	    			int num = rs.getInt(5);
	    			int type = rs.getInt(6);
	    			product = new Product(id,name,date,decribe,remarks,num,type);
	    			products.add(product);
	    		}
	    	}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			closeConnection();
		}
    	return products;
    }
    
}
