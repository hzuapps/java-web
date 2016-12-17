package edu.hzu.javaweb.labs.se1414080902220;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SqlHelp 
{
	public SqlHelp() 
	{
		
	}
	
	public int executeUpdate(String sql, Object[] params) 
	 {
	        int affectedLine = 0;    
	        Connection conn = null;
	    	PreparedStatement ps = null;    
	        try 
	        {    
	            conn = InitialConnect.getConnection();    
	            ps = conn.prepareStatement(sql);    
	                
	            if (params != null) 
	            {    
	                for (int i = 0; i < params.length; i++) 
	                {    
	                    ps.setObject(i + 1, params[i]);    
	                }    
	            }    
	                
	            affectedLine = ps.executeUpdate();    
	    
	        } catch (SQLException e) 
	        {    
	            System.out.println(e.getMessage());    
	        } finally {    
	            
	            InitialConnect.free(null, ps, conn);  
	        }    
	        return affectedLine;    
	    }  
	 
	 
	 
	 
	 public ResultSet executeQueryRS(String sql, Object[] params) {    
		 	Connection conn = null;
		 	PreparedStatement ps = null; 
		 	ResultSet rs=null;
		 	try {    
	            conn = InitialConnect.getConnection();    
	            ps = conn.prepareStatement(sql);    
	            if (params != null) 
	            {  
	            	int len=params.length;
	                for (int i = 0; i < len; i++) 
	                {    
	                    ps.setObject(i+1, params[i]);    
	                } 
	                
	            }      
	            rs= ps.executeQuery();    
	    
	        } catch (SQLException e) {    
	            System.out.println(e.getMessage());    
	        }    
	    
	        return rs;    
	    }    
}
