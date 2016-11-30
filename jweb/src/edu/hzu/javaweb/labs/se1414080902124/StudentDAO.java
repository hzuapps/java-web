package edu.hzu.javaweb.labs.se1414080902124;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2016/11/22.
 */
public class StudentDAO implements IStudentDAO {
    protected static final String FIELDS_INSERT = "id,stu_name,clazz,city,salary";
    protected static String INSERT_SQL = "insert into stu_info ("
            + FIELDS_INSERT + ")" + "values (?,?,?,?,?)";
    protected static String SELECT_SQL = "select "
            + FIELDS_INSERT + " from stu_info where id=?";
    protected static String UPDATE_SQL = "update stu_info set "
            + "id=?,stu_name=?,clazz=?,city=?,salary=? where id=?";
    protected static String DELETE_SQL = "delete from stu_info where id=?";

    //实现向数据库中添加记录的方法
    public Student insert(Student stu) throws Exception {
        System.out.println("执行插入方法");
        Connection con = null;
        PreparedStatement prepStmt = null;
        ResultSet rs = null;
        try {
            con = DbConnect.getDBConnection();
            prepStmt = con.prepareStatement(INSERT_SQL);
            prepStmt.setString(1, stu.getId());
            prepStmt.setString(2, stu.getName());
            prepStmt.setString(3, stu.getClazz());
            prepStmt.setString(4, stu.getCity());
            prepStmt.setString(5, stu.getSalary());
            prepStmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DbConnect.closeDB(con, prepStmt, rs);
        }
        return stu;
    }

    //实现删除数据库中指定的记录方法
    public void remove(Student stu) throws Exception {
        System.out.println("执行删除方法");
        Connection con = null;
        PreparedStatement prepStmt = null;
        ResultSet rs = null;
        try {
            con = DbConnect.getDBConnection();
            prepStmt = con.prepareStatement(DELETE_SQL);
            prepStmt.setString(1, stu.getId());
            prepStmt.executeUpdate();
        } catch (Exception e) {
            //
        } finally {
            DbConnect.closeDB(con, prepStmt, rs);
        }
    }

    //实现用指定的对象修改数据库中记录的方法
    public void update(Student stu) throws Exception {
        System.out.println("执行修改方法");
        Connection con = null;
        PreparedStatement prepStmt = null;
        ResultSet rs = null;
        try {
            con = DbConnect.getDBConnection();
            prepStmt = con.prepareStatement(UPDATE_SQL);
            prepStmt.setString(1, stu.getId());
            prepStmt.setString(2, stu.getName());
            prepStmt.setString(3, stu.getClazz());
            prepStmt.setString(4, stu.getCity());
            prepStmt.setString(5, stu.getSalary());
            int rowCount = prepStmt.executeUpdate();
            if (rowCount == 0) {
                throw new Exception("Update Error:Student Id:" + stu.getId());
            }
        } catch (Exception e) {
            // handle exception
        } finally {
            DbConnect.closeDB(con, prepStmt, rs);
        }
    }
}
