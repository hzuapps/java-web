package edu.hzu.javaweb.labs.se1414080902223;

import java.sql.*;

public class DbUtil {

	private Connection con = null;
	private PreparedStatement pstm = null;
	private ResultSet rs = null;
	
	public int updateSQL(String sql){
		int n = -1;
		try{
			con = DBConnection.getDBconnection();
			pstm = con.prepareStatement(sql);
			n = pstm.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}
		DBConnection.closeDB(con, pstm, rs);
		return n;
	}
	
	public ResultSet QuerySQL(String sql){
		try{
			con = DBConnection.getDBconnection();
			pstm = con.prepareStatement(sql);
			rs = pstm.executeQuery();
			return rs;
		}catch(SQLException e){
			e.printStackTrace();
		}
		return null;
	}
}