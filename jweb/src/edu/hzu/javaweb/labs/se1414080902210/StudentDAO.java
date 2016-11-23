package edu.hzu.javaweb.labs.se1414080902210;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import edu.hzu.javaweb.labs.se1414080902210.DbConnect;
import edu.hzu.javaweb.labs.se1414080902210.Student;

public class StudentDAO implements IStudent {
	protected static final String FIELDS_INSERT = "id,name,sex,age,weight,hight";
	protected static String INSERT_SQL = "insert into stu_info("+FIELDS_INSERT+")"+"values(?,?,?,?,?,?)";
	protected static String SELECT_SQL = "select * from stu_info where name=? and sex=?";
	protected static String UPDATE_SQL = "update stu_info set id=?,name=?,sex=?,age=?,weight=?,hight=? where id=?";
	protected static String DELETE_SQL = "delete from stu_info where id=?";
	@Override//插入
	public Student create(Student stu) throws Exception {
		Connection con = null ;
		PreparedStatement prepStmt = null;
		ResultSet rs = null;
		try {
			con = DbConnect.getConnection();
			prepStmt = con.prepareStatement(INSERT_SQL) ;//获取插入sql语句
			prepStmt.setInt(1, stu.getId());
			prepStmt.setString(2, stu.getName());
			prepStmt.setString(3, stu.getSex());
			prepStmt.setInt(4, stu.getAge());
			prepStmt.setFloat(5, stu.getWeight());
			prepStmt.setFloat(6, stu.getHight());
			prepStmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		} finally{
			DbConnect.closeDB(con, prepStmt, rs);
		}
		return stu;
		
	}

	@Override//删除某条信息
	public int remove(Student stu) throws Exception {
		Connection con = null ;
		PreparedStatement prepStmt = null;
		ResultSet rs = null;
		try {
			con = DbConnect.getConnection();
			prepStmt = con.prepareStatement(DELETE_SQL);
				prepStmt.setInt(1, stu.getId());
				int n = prepStmt.executeUpdate();
				return n;
		}finally{
			DbConnect.closeDB(con, prepStmt, rs);
		}
	}

	@Override//查询所有学生
	public Student find(Student stu) throws Exception {
		Connection con = null ;
		PreparedStatement prepStmt = null;
		ResultSet rs = null;
		Student stu2 = null;
		try {
			con = DbConnect.getConnection();
			System.out.println("明天好");
			prepStmt = con.prepareStatement(SELECT_SQL) ;
			prepStmt.setString(1, stu.getName());
			prepStmt.setString(2, stu.getSex());
			rs = prepStmt.executeQuery();//执行查询操作
			if(rs.next())
			{
				stu2 = new Student();//实例化一个stu2
				stu2.setId(rs.getInt(1));
				stu2.setName(rs.getString(2));
				stu2.setSex(rs.getString(3));
				stu2.setAge(rs.getInt(4));
				stu2.setWeight(rs.getFloat(5));
				stu2.setHight(rs.getFloat(6));
			}			
		} catch (Exception e) {
			// TODO: handle exception
		} finally{
			DbConnect.closeDB(con, prepStmt, rs);
		}
		return stu2;
	}

	@Override//查询所有
	public List<Student> findAll() throws Exception {
		Connection con = null ;
		PreparedStatement prepStmt = null;
		ResultSet rs = null;
		List<Student>student = new ArrayList<Student>();//创建存放Student对象的集合
		con = DbConnect.getConnection();
		prepStmt = con.prepareStatement("select * from stu_info");
		rs = prepStmt.executeQuery();
		while (rs.next()) {
			Student stu2 = new Student();
			stu2 = new Student();//将查询到的**实例化
			stu2.setId(rs.getInt(1));
			stu2.setName(rs.getString(2));
			stu2.setSex(rs.getString(3));
			stu2.setAge(rs.getInt(4));
			stu2.setWeight(rs.getFloat(5));
			stu2.setHight(rs.getFloat(6));
			student.add(stu2);//添加到链表
		}
		DbConnect.closeDB(con, prepStmt, rs);
		return student;//返回链表
	}

	@Override//用指定对象实现修改数据
	public int update(Student stu) throws Exception {
		Connection con = null ;
		PreparedStatement prepStmt = null;
		ResultSet rs = null;
		try {
			con = DbConnect.getConnection();
			prepStmt = con.prepareStatement(UPDATE_SQL) ;//获取插入sql语句
			prepStmt.setInt(1, stu.getId());
			prepStmt.setString(2, stu.getName());
			prepStmt.setString(3, stu.getSex());
			prepStmt.setInt(4, stu.getAge());
			prepStmt.setFloat(5, stu.getWeight());
			prepStmt.setFloat(6, stu.getHight());
			prepStmt.setInt(7, stu.getId());
			int n = prepStmt.executeUpdate();
			return n;
		}finally{
			DbConnect.closeDB(con, prepStmt, rs);
		}
		
	}
	
}
