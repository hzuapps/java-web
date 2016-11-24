package edu.hzu.javaweb.labs.se1414080902221;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;


public class DatabaceCon  {

	public static Connection getconnect(){
		String DBDRIVER="com.mysql.jdbc.Driver";
		String URL="jdbc:mysql://localhost:3306/goodsinfo";
		String USER = "root";
		String PASSWORD = "admin";
	    Connection con = null;
	    try{
	    	Class.forName(DBDRIVER);
	    	con = DriverManager.getConnection(URL,USER,PASSWORD);	
	    }catch(Exception e){
			System.out.println(e);
		}
		return con;
	}
	
	public static void Finally(Connection con,Statement stmt){
        if(stmt!=null){
        	try{
    			stmt.close();
    			}catch(SQLException e){}
    		}
    	if(con!=null){
    		try{
    			con.close();
    		    }catch(SQLException e){}
    		}
    	}  
}

