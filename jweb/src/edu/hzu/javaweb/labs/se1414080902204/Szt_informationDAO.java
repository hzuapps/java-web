package com.dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.db.DbConnect;
import com.domain.Szt_information;

public class Szt_informationDAO {
	
	protected static final String FIELDS_INSERT="name,idcard,card,phonenumber";
	protected static String INSERT_SQL="insert into szt_information("+FIELDS_INSERT+")"+"values(?,?,?,?)";
	protected static String SELECT_SQL="select"+" " +FIELDS_INSERT+" "+"from szt_information where card=?";
	protected static String UPDATE_SQL="update szt_information"+"name=?,idcard=?,card=?,phonenumber=?,yue=?";
	protected static String DELETE_SQL="delete from szt_information where card=?";
	
	
	
	
	//实现向数据库与添加记录的方法
	public Szt_information create(Szt_information szt) throws Exception{
		Connection con=null;
		PreparedStatement prepStmt=null;
		ResultSet rs=null;
		try{
			con=DbConnect.getDBconnection();
			prepStmt=con.prepareStatement(INSERT_SQL);
			prepStmt.setString(1, szt.getName());
			prepStmt.setString(2, szt.getIdcard());
			prepStmt.setString(3, szt.getCard());
			prepStmt.setString(4, szt.getPhonenumber());
		/*	prepStmt.setDouble(5, szt.getYue());*/
			prepStmt.executeUpdate();
			
		}catch(Exception E){
			E.printStackTrace();
		}finally{
			DbConnect.closeDB(con, prepStmt, rs);
		}
		
		return szt;
	}

	//实现查询数据库中对指定的记录是否存在的方法
	public Szt_information find(Szt_information szt) throws Exception{
		Connection con=null;
		PreparedStatement prepStmt=null;
		ResultSet rs=null;
		Szt_information szt2=null;
		try{
			con=DbConnect.getDBconnection();
			prepStmt=con.prepareStatement(SELECT_SQL);
			prepStmt.setString(1, szt.getCard());
			rs = prepStmt.executeQuery();
			if(rs.next()){
				szt2=new Szt_information();
				szt2.setName(rs.getString(1));
				szt2.setIdcard(rs.getString(2));
				szt2.setCard(rs.getString(3));
				szt2.setPhonenumber(rs.getString(4));
/*				szt2.setYue(rs.getDouble(5));*/
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DbConnect.closeDB(con, prepStmt, rs);
		}
		
		return szt2;
	}
	
	
	//实现列出数据库全部记录的方法
	public List<Szt_information> findAll() throws Exception{
		Connection con=null;
		PreparedStatement prepStmt=null;
		ResultSet rs=null;
		List<Szt_information> szt_information =new ArrayList<Szt_information>();
		con=DbConnect.getDBconnection();
		prepStmt=con.prepareStatement("select * from stu_info");
		rs=prepStmt.executeQuery();
		while(rs.next()){
			Szt_information szt2=new Szt_information();
			szt2.setName(rs.getString(1));
			szt2.setIdcard(rs.getString(2));
			szt2.setCard(rs.getString(3));
			szt2.setPhonenumber(rs.getString(4));
			szt2.setYue(rs.getDouble(5));
			szt_information.add(szt2);
			
		}
		
			
	
			DbConnect.closeDB(con, prepStmt, rs);
	
		return szt_information;
	}
	
	//实现删除数据库中指定的记录方法
	public void remove(Szt_information szt) throws Exception{
		Connection con=null;
		PreparedStatement prepStmt=null;
		ResultSet rs=null;
		try{
			con=DbConnect.getDBconnection();
			prepStmt=con.prepareStatement(DELETE_SQL);
				prepStmt.setString(1, szt.getCard());
				prepStmt.executeUpdate();
			
		}catch(Exception e){
			
		}finally{
			DbConnect.closeDB(con, prepStmt, rs);
		}
		
	}
	
	
	//实现用指定的对象修改数据库中记录的方法
		public void update(Szt_information szt) throws Exception{
			Connection con=null;
			PreparedStatement prepStmt=null;
			ResultSet rs=null;
			try{
				con=DbConnect.getDBconnection();
				prepStmt=con.prepareStatement(UPDATE_SQL);
				prepStmt.setString(1, szt.getName());
				prepStmt.setString(2, szt.getIdcard());
				prepStmt.setString(3, szt.getCard());
				prepStmt.setString(4, szt.getPhonenumber());
				prepStmt.setDouble(5, szt.getYue());
				int rowCount=prepStmt.executeUpdate();
				if(rowCount==0){
					throw new Exception("Update Error:Szt_information card:"+szt.getCard());
				}
				
				
			}catch(Exception e){
				
			}finally{
				DbConnect.closeDB(con, prepStmt, rs);
			}
			
			
		}

}
