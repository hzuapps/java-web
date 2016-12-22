package com.HotelDAO;
import java.sql.*;
import javaBean.db.*;
import javaBean.Customer;
public class HotelsDAO implements HotelDAO{
	protected static final String FIELDS_INSERT="id,name,room,bill";
	protected static String INSERT_SQL="insert into cus_info("
			+FIELDS_INSERT+")"+"values(?,?,?,?)";
	protected static String DELETE_SQL="delete from cus_info where id=?";
	protected static String SELECT_SQL="select"
			+FIELDS_INSERT+"frome cus_info where id=?";
//实现向数据库中添加记录
	public int create(Customer cus)throws Exception{
		Connection con=null;
		PreparedStatement prepStmt=null;
		ResultSet rs=null;
		int n=0;
		try{
			con=DbConnect.getDBconnection();
			prepStmt=con.prepareStatement(INSERT_SQL);
			prepStmt.setDouble(1,cus.getId());
			prepStmt.setString(2, cus.getName());
			prepStmt.setInt(3,cus.getRoom());
			prepStmt.setFloat(4, 0);
			n=prepStmt.executeUpdate();
			System.out.print(cus.getName());
		}catch(Exception e){
			DbConnect.closeDB(con,prepStmt,rs);
		}
		return n;
	}

//实现查询数据库中对指定的记录是否存在
	public Customer find(Customer cus)throws Exception{
		Connection con=null;
		PreparedStatement prepStmt=null;
		ResultSet rs=null;
		Customer cus2=null;
		try{
			con=DbConnect.getDBconnection();
			prepStmt=con.prepareStatement(INSERT_SQL);
			prepStmt.setDouble(1, cus.getId());
			rs=prepStmt.executeQuery();
			if(rs.next()){
				cus2=new Customer();
				cus2.setId(rs.getInt(1));
				cus2.setName(rs.getString(2));
				cus2.setRoom(rs.getInt(3));
				cus2.setBill(rs.getFloat(4));
			}
			}catch(Exception e){
				
			}finally{
				DbConnect.closeDB(con, prepStmt, rs);
			}
		return cus2;
		}
	
	public void remove(Customer cus)throws Exception{
		Connection con=null;
		PreparedStatement prepStmt=null;
		ResultSet rs=null;
		try{
			con=DbConnect.getDBconnection();
			prepStmt=con.prepareStatement(DELETE_SQL);
				prepStmt.setDouble(1,cus.getId());
				prepStmt.executeUpdate();
		}catch(Exception e){
			
		}finally{
			DbConnect.closeDB(con,prepStmt,rs);
		}
		}
}