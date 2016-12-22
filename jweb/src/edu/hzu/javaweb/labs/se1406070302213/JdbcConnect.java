package edu.hzu.javaweb.labs.se1406070302213;

import java.sql.Connection;
 import java.sql.DriverManager;
 import java.sql.PreparedStatement;
 import java.sql.ResultSet;
 import java.sql.SQLException;
 import java.util.ArrayList;
 import java.util.List;
 
 public class JdbcConnect {
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
     
     public List<Userinfo> getUserinfo(){
     	List<Userinfo> userinfos = new ArrayList();
     	Userinfo userinfo = null;
     	String sql = "select * from userinfo;";
     	try {
     		connect = getConnection();
 			statement = (PreparedStatement) connect.prepareStatement(sql);
 	    	rs = statement.executeQuery();
 	    	if(rs != null){
 	    		while(rs.next()){
 	    			String id = rs.getString(0);
 	    			String name = rs.getString(1);
 	    			String date = rs.getString(2);
 	    			boolean sex = rs.getBoolean(3);
 	    			int age = rs.getInt(4);
 	    			userinfo = new Userinfo(id,name,date,sex,age);
 	    			userinfo.add(userinfo);
 	    		}
 	    	}
 		} catch (SQLException e) {
 			e.printStackTrace();
 		}finally{
 			closeConnection();
 		}
     	return userinfos;
     }
     
 }
