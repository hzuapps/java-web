package dao;
import java.sql.*;
import java.util.ArrayList;
import vo.User;
import dbc.Jdbc;


public class UserDao {
	public void add(User user)throws Exception{
		Connection conn=null;
		PreparedStatement ps=null;
		try{
			conn=Jdbc.getConnection();
			String sql="insert into cardos(id,status,account) values(?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, user.getUserid());
			ps.setString(2, user.getUserstatus());
			ps.setString(3, user.getaccount());
			ps.executeUpdate();
		}finally{Jdbc.free(null, ps, conn);}
	}
	public void update(User user)throws Exception{
		Connection conn=null;
		PreparedStatement ps =null;
		try{
			conn = Jdbc.getConnection();
			String sql="update cardos set account=account+? where id=?";
			ps =conn.prepareStatement(sql);
			ps.setString(1, user.getaccount());
			ps.setString(2,user.getUserid());
			ps.executeUpdate();
		}finally{Jdbc.free(null, ps, conn);}
	}
	public User findUserById(String userId)throws Exception{
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		User user=null;
		try{
			conn = Jdbc.getConnection();
			String sql="select * from cardos where id=?";
			ps= conn.prepareStatement(sql);
			ps.setString(1, userId);
			rs=ps.executeQuery();
			if(rs.next()){
				user=new User();
				user.setUserid(rs.getString(1));
				user.setUserstatus(rs.getString(2));
				user.setaccount(rs.getString(3));
			}
		}finally{Jdbc.free(rs,ps,conn);}
		return user;
	}
	
}
