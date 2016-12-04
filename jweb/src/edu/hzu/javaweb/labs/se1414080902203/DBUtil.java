package edu.hzu.javaweb.labs.se1414080902203;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import edu.hzu.javaweb.labs.se1414080902203.DBConnection;

public class DBUtil {

	private Connection con=null;
	private PreparedStatement pstm=null;
	private ResultSet rs=null;

	public int updateSql(String sql){
		int n=-1;
		try{
			con=DBConnection.getDBconnection();
			pstm=con.prepareStatement(sql);
			n=pstm.executeUpdate();
		}
		catch(SQLException e){e.printStackTrace();}
		DBConnection.closeDB(con,pstm,rs);
		return n;
		
	}
	public ResultSet QuerySQL(String sql){
		try{
			con=DBConnection.getDBconnection();
			pstm=con.prepareStatement(sql);
			rs=pstm.executeQuery();
		}catch(SQLException e) {e.printStackTrace();}
		return null;}
}
