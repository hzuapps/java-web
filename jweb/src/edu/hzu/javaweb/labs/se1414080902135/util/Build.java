package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import model.Shop;

public class Build {
	public Boolean add(String id,String pass){
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		Boolean judge=null;
		String sql="insert into user values(?,?)";
		
		
		Con_mysql con_mysql=new Con_mysql();
		con=con_mysql.getConnection();
		
		
		
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, pass);
			//ps.executeUpdate();���ظı����ݵ�����
			ps.executeUpdate();
			judge=true;
		} catch (SQLException e) {
			judge=false;
			System.out.println("");
			e.printStackTrace();
		}
		con_mysql.closes(con, ps, rs);
		return judge;
	}
	
	//��ѯ�Ѵ����û��˺�
	public Map<String,String> querys(){
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		String sql="select * from user";
		Map<String,String>map=new HashMap<String,String>();
		
		
		
		Con_mysql con_mysql=new Con_mysql();
		con=con_mysql.getConnection();

		
		try {
			st = con.createStatement();
			rs=st.executeQuery(sql);
			while(rs.next()){
				map.put(rs.getString(1),rs.getString(2));
			}
		} catch (SQLException e) {
			System.out.println("��ѯ�û�ʧ��");
			e.printStackTrace();
		}
		con_mysql.close(con, st, rs);
		return map;
	}
	
	public ArrayList<Shop> GetShop(){
		Con_mysql cm=new Con_mysql();
		Connection co=cm.getConnection();
		
		String sql="select * from shop";
		Statement st=null;
		ResultSet rs=null;
		
		Shop shop=new Shop();
		ArrayList<Shop> array=new ArrayList<Shop>();
		try {
			st = co.createStatement();
		} catch (SQLException e) {
			System.out.println("������ѯ����ʧ��");
			e.printStackTrace();
		}
		
		try {
			rs = st.executeQuery(sql);
		} catch (SQLException e) {
			System.out.println("��ѯʧ��");
			e.printStackTrace();
		}
		try {
			while(rs.next()){
				shop.setShop_name(rs.getString(1));
				shop.setShop_id(rs.getString(2));
				shop.setPrice(rs.getString(3));
				shop.setDescript(rs.getString(4));
				shop.setNum(rs.getInt(5));
				shop.setBrand(rs.getString(6));
				
				array.add(shop);
			}
		} catch (SQLException e) {
			System.out.println("��ȡ����ʧ��");
			e.printStackTrace();
		}
		
		return array;
	}
}
