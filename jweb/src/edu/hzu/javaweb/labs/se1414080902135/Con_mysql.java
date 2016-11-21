package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;
import java.io.IOException;
import java.io.InputStream;

public class Con_mysql {
	private static String url="";
	private static String driver="";
	private static String username="";
	private static String password="";
	private static Connection con=null;
	private static Properties pp=null;
	private static InputStream io=null;
	
	//获取配置文件信息
	static{
		pp=new Properties();
		io=Con_mysql.class.getClassLoader().getResourceAsStream("util/db.properties");
		try {
			pp.load(io);
			url=pp.getProperty("url");
			driver=pp.getProperty("driver");
			username=pp.getProperty("username");
			password=pp.getProperty("password");
		} catch (IOException e) {
			System.out.println("加载配置文件失败");
			e.printStackTrace();
		}
		
	}
	
	//
	public Connection getConnection(){
		try {
			Class.forName(driver);
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
		return con;
	}
	
	//创建链接
	public void close(Connection con,Statement st,ResultSet rs){
		if(null!=rs){
			try {
				rs.close();
			} catch (SQLException e) {
				System.out.println("关闭rs接口失败");
				e.printStackTrace();
			}finally{
				if(null!=st){
					try {
						st.close();
					} catch (SQLException e) {
						System.out.println("关闭st接口失败");
						e.printStackTrace();
					}finally{
						if(null!=con){
							try {
								con.close();
							} catch (SQLException e) {
								System.out.println("关闭con接口失败");
								e.printStackTrace();
							}
						}
					}
				}
			}
		}
	}

	public void closes(Connection con,PreparedStatement ps,ResultSet rs){
		if(null!=rs){
			try {
				rs.close();
			} catch (SQLException e) {
				System.out.println("关闭rs接口失败");
				e.printStackTrace();
			}finally{
				if(null!=ps){
					try {
						ps.close();
					} catch (SQLException e) {
						System.out.println("关闭ps接口失败");
						e.printStackTrace();
					}finally{
						if(null!=con){
							try {
								con.close();
							} catch (SQLException e) {
								System.out.println("关闭con接口失败");
								e.printStackTrace();
							}
						}
					}
				}
			}
		}
	}
}
