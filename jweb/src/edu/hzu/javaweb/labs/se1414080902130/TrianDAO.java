package train;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;

import train.DbConnect;
import train.Train_ticket;
import train.Train;

public class TrianDAO {
      public List<Train> find(String despartPlase, String destination,
      String despartDate,String returnDate) throws Exception
      {   
    	  Connection con = null;
    	  PreparedStatement prepStmt = null;
    	  ResultSet rs = null;
    	  List<Train> train = new ArrayList<Train>();
    	  try
    	  {
        	SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");  
        	java.util.Date date1 = sdf1.parse(despartDate.toString());
        	java.sql.Date sqldate1 =new java.sql.Date(date1.getTime());
        	SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");  
        	java.util.Date date2 = sdf2.parse(returnDate.toString());
        	java.sql.Date sqldate2 =new java.sql.Date(date2.getTime());  
    	    con = DbConnect.getDBconnection();
    	    prepStmt = con.prepareStatement("select * from train_ticket where despartPlace = ? and destination = ? and despartDate = ? and returnDate = ?");
    	    prepStmt.setString(1,despartPlase);
    	    prepStmt.setString(2,destination);
    	    prepStmt.setDate(3,sqldate1);
    	    prepStmt.setDate(4,sqldate2);
    	    rs = prepStmt.executeQuery();
    	    while(rs.next())
    	    {
    		     int a = 0 , b = 0 , c = 0, d = 0;
    	    	 Train tra = new Train();
    	    	 tra.setTrainID(rs.getString(1));
    	      	 tra.setDespartPlace(rs.getString(2));
    	      	 tra.setDestination(rs.getString(3));
    	      	 tra.setDespartTime(rs.getString(6));
    	      	 tra.setArrivalTime(rs.getString(7));
    	      	 if("空".equals(rs.getString(12)))
    	        {
    	      		if("商务座".equals(rs.getString(10)))
    	      		   a++;
    	      		else if("一等座".equals(rs.getString(10)))
    	      		   b++;
    	      		else if("二等座".equals(rs.getString(10)))
    	      		   c++;
    	      		else 
    	      		   d++;
    	      	 }
      	      	tra.setBusinessSeat(a);
        		tra.setFirstSeat(b);
        		tra.setSecondSeat(c);
        		tra.setNullSeat(d);
        		train.add(tra);
    	    }
    	  }
    	  catch(Exception e)
    	  {
    		  e.printStackTrace();
    	  }
    	  finally
    	  {
             DbConnect.closeDB(con, prepStmt, rs);
    	  }
    	  return train;
      }
}
