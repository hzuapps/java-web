package dao;
import java.sql.*;
import java.util.Arraylist;
import vo.User;
import dbc.JdbcUtil;
public class UserDAO {
//向数据库中添加用户订单记录的方法add()
	public void add(User user)throws Exception{
		Connection conn=null;
		PreparedStatement ps=null;
		try{
			conn=JdbcUtil.getConnection();
			String sql="insert into user  values(?,?,?)"
		    ps=conn.prepareStatement(sql);
			ps.setString(1,user.getUserid());
			ps.setString(2,user.getOperator());
			ps.setInt(3,user.getValue());
			ps.executeUpdate();
		}finally{JdbcUtil.free(null,ps,conn);}
	}
//修改数据库用户订单记录的方法update()
	public void update(User user)throws Exception{
		Connection conn=null;
		PreparedStatement ps=null;
		try{
			conn=JdbcUtil.getConnection();
			String sql="update user set username=?,sex=?where userid=?";
		    ps=conn.prepareStatement(sql);
			ps.setString(1,user.getUserid());
			ps.setString(2,user.getOperator());
			ps.setInt(3,user.getValue());
			ps.executeUpdate();
		}finally{JdbcUtil.free(null,ps,conn);}
	}
//删除数据用户订单记录的方法delete()
	public void delete(String userId)throws Exception{
		Connection conn=null;
		PreparedStatement ps=null;
		try{
			conn=JdbcUtil.getConnection();
			String sql="delete from user where useridQ=?";
		    ps=conn.prepareStatement(sql);
			ps.setString(1,userId);
			ps.executeUpdate();
		}finally{JdbcUtil.free(null,ps,conn);}
	}
}