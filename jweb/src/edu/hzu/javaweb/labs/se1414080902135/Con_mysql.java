package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Con_mysql {
	private static String url="jdbc:mysql://127.0.0.1:3306/text?useUnicode=true&amp;characterEncoding=utf-8";
	private static String Driver="com.mysql.jdbc.Driver";
	private static String username="root";
	private static String password="ch273854";
	private static Connection con=null;
	static{
		try {
			Class.forName(Driver);
		} catch (ClassNotFoundException e) {
			System.out.println("驱动加载失败");
			e.printStackTrace();
		}
		try {
			con=DriverManager.getConnection(url,username,password);
		} catch (SQLException e) {
			System.out.println("创建链接失败");
			e.printStackTrace();
		}
	}
	
	public Connection getConnection(){
		return con;
	}
}
