package KK;
import java.sql.*;
public class Util {
   private Connection con=null;
   private PreparedStatement pstmt=null;
   private ResultSet rs=null;
   public int insertSQL(String sql){
	   int n=-1;
	   try{
		   con=Connect.sqlData(); 
		   pstmt=con.prepareStatement(sql);
		   n=pstmt.executeUpdate();
	   }catch(SQLException e){e.printStackTrace();}
	   Connect.close(con, pstmt, rs);
	   return n;
   }
}
