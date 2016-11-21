package KK;
import java.sql.*;
public class Connect {
	 public static Connection sqlData(){
	        Connection con=null;
	        try{
	        Class.forName("com.mysql.jdbc.Driver");
	        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/book?user=root&password=root");
	        }catch(Exception ee){}
	        return con;
	 }
      public static void close(Connection con,PreparedStatement pstm,ResultSet rs)
      {
    	  try{
    		  if(rs!=null) rs.close();
    		  if(pstm!=null) pstm.close();
    		  if(con!=null) con.close();
    	  }catch(SQLException e){
    		  e.printStackTrace();
    	  }
      }
}

