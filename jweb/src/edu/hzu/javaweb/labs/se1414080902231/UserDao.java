package edu.hzu.javaweb.labs.se1414080902231;

import java.sql.*;

public class UserDao implements InUserDao{
	
	//添加用户
	public int createUser(User user) {
		
		Connection conn=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		int i=0;
		try{
			conn=Jdbc.getConn();
			//先查询用户名是否被用过
			String username=user.getUsername();
			String password=user.getPassword();
			String sql="insert into user_info(username,password) values(?,?)";
			pst=conn.prepareStatement(sql);
			pst.setString(1, username);
			pst.setString(2, password);
			i=pst.executeUpdate();
		
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			Jdbc.free(rs, pst, conn);
		}
		if(i==1)
			return 1;
		return 0;
	}

	//查询用户,登陆帐号密码是否正确
	public User findUser(String username,String password) {
		Connection conn=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		User u=null;
		try{
			conn=Jdbc.getConn();
			String sql="select username , password from user_info where username=?";
			pst=conn.prepareStatement(sql);
			pst.setString(1, username);
			rs=pst.executeQuery();
			
			if(rs.next())
			{
				u=new User();
				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			Jdbc.free(rs, pst, conn);
		}
		
		return u;
		
	}

	//查询用户名
	public int checkUser(String username) {
		Connection conn=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		try{
			conn=Jdbc.getConn();
			//先查询用户名是否被用过
			String sql1="select username from user_info where username=?";
			pst=conn.prepareStatement(sql1);
			pst.setString(1, username);
			rs=pst.executeQuery();
			if(rs.next())
			{	
				return 1;//表示被用过
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			Jdbc.free(rs, pst, conn);
		}
		return 0;
		
	}

	//更新密码
	public int updateUer(User user) {
		Connection conn=null;
		PreparedStatement pst=null;
		int flag=0;
		try{
			conn=Jdbc.getConn();
			String sql="update user_info set password=? where username=?";
			pst=conn.prepareStatement(sql);
			pst.setString(1, user.getPassword());
			pst.setString(2, user.getUsername());
			flag=pst.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			Jdbc.free(null, pst, conn);
		}
		return flag;
	}
	
}
