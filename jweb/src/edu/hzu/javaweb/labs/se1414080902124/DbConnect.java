package edu.hzu.javaweb.labs.se1414080902124;

import java.sql.*;

/**
 * Created by Administrator on 2016/11/22.
 */
public class DbConnect {
    private static String driverName = "com.mysql.jdbc.Driver";   //驱动程序名
    private static String userName = "root";                    //数据库用户名
    private static String userPwd = "335588";                  //密码
    private static String dbName = "students";                 //数据库名

    public static Connection getDBConnection() {
        String url1 = "jdbc:mysql://localhost/" + dbName;
        String url2 = "?user=" + userName + "&password=" + userPwd;
        String url3 = "&useUnicode=true&characterEncoding=utf8";
        String url = url1 + url2 + url3;
        try {
            Class.forName(driverName);
            Connection con = DriverManager.getConnection(url, userName, userPwd);
            System.out.println("已连接db");
            return con;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void closeDB(Connection con, PreparedStatement pstm, ResultSet rs) {
        try {
            if (rs != null) try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            if (pstm != null) pstm.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
