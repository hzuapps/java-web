package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import vo.User;
import dbc.JdbcUtil;

public class UserDao{
	public void add(User user) throws Exception{
		Connection conn = null;
		PreparedStatement ps = null;
		try{
			conn = JdbcUtil.getConnection();
			String sql = "insert into user	values(?,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, user.getUsername());
			ps.setString(2, user.getPassword());
			ps.setString(3, user.getcustomerName());
			ps.setString(4, user.getUseraddr());
			ps.executeUpdate();
		}finally{JdbcUtil.free(null, ps, conn);}
	}
	
	public void update(User user) throws Exception{
		Connection conn = null;
		PreparedStatement ps = null;
		try{
			conn = JdbcUtil.getConnection();
			String sql = "update user set password=?,customername=?,useraddr=? where username=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, user.getPassword());
			ps.setString(2, user.getcustomerName());
			ps.setString(3, user.getUseraddr());
			ps.setString(4, user.getUsername());
			ps.executeUpdate();
		}finally{JdbcUtil.free(null, ps, conn);}
	}
	
	public void delete(String userName) throws Exception{
		Connection conn = null;
		PreparedStatement ps = null;
		try{
			conn = JdbcUtil.getConnection();
			String sql = "delete from user where username=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, userName);
			ps.executeUpdate();
		}finally{JdbcUtil.free(null, ps, conn);}
	}
	
	public User findUserByName(String userName) throws Exception{
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		User user = null;
		try{
			conn = JdbcUtil.getConnection();
			String sql = "select * from user where username=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, userName);
			rs = ps.executeQuery();
			if(rs.next()){
				user = new User();
				user.setUsername(rs.getString(1));
				user.setPassword(rs.getString(2));
				user.setcustomerName(rs.getString(3));
				user.setUseraddr(rs.getString(4));
			}
		}finally{JdbcUtil.free(null, ps, conn);}
		return user;
	}
	
	public List<User> QueryAll() throws Exception{
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<User> userList=new ArrayList<User>();
		try{
			conn = JdbcUtil.getConnection();
			String sql = "select * from user";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()){
				User user = new User();
				user.setUsername(rs.getString(1));
				user.setPassword(rs.getString(2));
				user.setcustomerName(rs.getString(3));
				user.setUseraddr(rs.getString(4));
				userList.add(user);
			}
		}finally{JdbcUtil.free(null, ps, conn);}
		return userList;
	}
	
}