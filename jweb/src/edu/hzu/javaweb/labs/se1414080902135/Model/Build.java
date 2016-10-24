package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Build {
	private PreparedStatement ps=null;
	private Statement st=null;
	private Connection conn=null;
	public Boolean query(String id,String pass){
		Con_mysql con_mysql=new Con_mysql();
		conn=con_mysql.getConnection();
		String sql="select * from user where user_id=? and password=?";
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, pass);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				return true;
			}
		} catch (SQLException e) {
			System.out.println("查询数据失败");
			e.printStackTrace();
		}finally{
			free();
		}
		return false;
	}
	
	public Boolean add(String id,String pass){
		Con_mysql con_mysql=new Con_mysql();
		conn=con_mysql.getConnection();
		String sql="insert into user values(?,?)";
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, pass);
			//chang_link:改变数据表中的行数
			int change_link=ps.executeUpdate();
			if(change_link==1){
				return true;
			}
		} catch (SQLException e) {
			System.out.println("添加用户失败");
			e.printStackTrace();
		}finally{
			free();
		}
		return false;
	}
	
	//查询用户账号
	public List<String> querys(){
		Con_mysql con_mysql=new Con_mysql();
		conn=con_mysql.getConnection();
		String sql="select user_id from user";
		List<String> li=new ArrayList<String>();
		try {
			st = conn.createStatement();
			ResultSet rs=st.executeQuery(sql);
			while(rs.next()){
				li.add(rs.getString(1));
			}
		} catch (SQLException e) {
			System.out.println("查询失败");
			e.printStackTrace();
		}finally{
			try {
				if(st==null){
					st.close();
				}
			} catch (SQLException e1) {
				System.out.println("关闭查询对象失败");
				e1.printStackTrace();
			}
			try {
				if(conn==null){
					conn.close();
				}
			} catch (SQLException e) {
				System.out.println("链接对象关闭失败");
				e.printStackTrace();
			}
		}
		return li;
	}
	
	public void free(){
		try {
			if(ps==null){
				ps.close();
			}
		} catch (SQLException e) {
			System.out.println("预查询对象关闭失败");
			e.printStackTrace();
		}
		try {
			if(conn==null){
				conn.close();
			}
		} catch (SQLException e) {
			System.out.println("链接对象关闭失败");
			e.printStackTrace();
		}
	}
}
