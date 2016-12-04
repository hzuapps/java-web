package edu.hzu.javaweb.labs.se1414080902223;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import edu.hzu.javaweb.labs.se1414080902223.IStudentDAO;
import edu.hzu.javaweb.labs.se1414080902223.DBConnection;
import edu.hzu.javaweb.labs.se1414080902223.Score;

public class ScoreDao implements IStudentDAO{
	
	protected static final String FIELDS_INSERT = "stuid,classno,grade";
	protected static String INSERT_SQL = "insert into score (" + FIELDS_INSERT + ")" + " values(?,?,?)";
	protected static String SELECT_SQL = "select " + FIELDS_INSERT + " from score where stuid=?";
	protected static String UPDATE_SQL = "update score set " + "stuid=?,classno=?,grade=? where stuid=?";
	protected static String DELETE_SQL = "delete from score where stuid=?";
	
	public Score create(Score sco) throws Exception {
		Connection con = null;
		PreparedStatement prepStmt = null;
		ResultSet rs = null;
		try{
			
			con = DBConnection.getDBconnection();
			prepStmt = con.prepareStatement(INSERT_SQL);
			prepStmt.setInt(1, sco.getStuid());
			prepStmt.setInt(2, sco.getClassno());
			prepStmt.setInt(3, sco.getGrade());
			prepStmt.executeUpdate();
			
		}catch(Exception e){
			
		}finally{
			DBConnection.closeDB(con, prepStmt, rs);
		}
		return sco;
	}
	
	public void remove(Score sco) throws Exception {
		Connection con = null;
		PreparedStatement prepStmt = null;
		ResultSet rs = null;
		try{
			
			con = DBConnection.getDBconnection();
			prepStmt = con.prepareStatement(DELETE_SQL);
			prepStmt.setInt(1, sco.getStuid());
			prepStmt.executeUpdate();
			
		}catch(Exception e){
			
		}finally{
			DBConnection.closeDB(con, prepStmt, rs);
		}
		
	}
	
	@Override
	public Score find(Score stu) throws Exception {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement prepStmt = null;
		ResultSet rs = null;
		Score sco2 = null;
		try{
			con = DBConnection.getDBconnection();
			prepStmt = con.prepareStatement(SELECT_SQL);
			prepStmt.setInt(1, stu.getStuid());
			rs = prepStmt.executeQuery();
			if(rs.next()){
				sco2 = new Score();
				sco2.setStuid(rs.getInt(1));
				sco2.setClassno(rs.getInt(2));
				sco2.setGrade(rs.getInt(3));
			}
		}catch(Exception e){
			
		}finally{
			DBConnection.closeDB(con, prepStmt, rs);
		}
		return sco2;
	}
	
	public List<Score> findAll() throws Exception {
			// TODO Auto-generated method stub
			
		Connection con = null;
		PreparedStatement prepStmt = null;
		ResultSet rs = null;
		List<Score> score = new ArrayList<Score>();
		con = DBConnection.getDBconnection();
		prepStmt = con.prepareStatement("select * from score");
		rs = prepStmt.executeQuery();
		while(rs.next()){
			Score  sco = new Score();
			sco.setStuid(rs.getInt(1));
			sco.setClassno(rs.getInt(2));
			sco.setGrade(rs.getInt(3));
			score.add(sco);
		}
		DBConnection.closeDB(con, prepStmt, rs);
		return score;
	}



	@Override
	public void update(Score sco) throws Exception {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement prepStmt = null;
		ResultSet rs = null;
		try{
			con = DBConnection.getDBconnection();
			prepStmt = con.prepareStatement(UPDATE_SQL);
			prepStmt.setInt(1, sco.getStuid());
			prepStmt.setInt(2, sco.getClassno());
			prepStmt.setInt(3, sco.getGrade());

			int rowCount = prepStmt.executeUpdate();
			if(rowCount == 0){
				throw new Exception("Update Error:Score stuid:" + sco.getStuid());
			}
		}catch(Exception e){
			
		}finally{
			DBConnection.closeDB(con, prepStmt, rs);
		}
	}
}
