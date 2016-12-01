package edu.hzu.javaweb.labs.se1414080902201;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Se1414080902201Servlet
 */
@WebServlet(name="Se1414080902201Servlet",urlPatterns="/1414080902201")
public class Se1414080902201Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// JDBC 驱动名及数据库 URL
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
	static final String DB_URL = "jdbc:mysql://localhost:3306/todox?characterEncoding=utf-8";
	
	// 数据库的用户名与密码
	static final String USER = "root";
	static final String PASS = ""; 
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Se1414080902201Servlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("处理get请求...");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("处理post请求...");
		Connection conn = null;
		Statement stmt = null;
		String id = null;
        // 接收数据
        String item = request.getParameter("item");
        //获取cookie
        Cookie cookie = null;
    	Cookie[] cookies = null;
    	cookies = request.getCookies();

    	for (int i = 0; i < cookies.length; i++){
    		cookie = cookies[i];
    		if((cookie.getName()).equals("id")){
    			id = cookie.getValue();
    			break;
    		}
    	}
        //连接数据库
        try{
			// 注册 JDBC 驱动器
			Class.forName("com.mysql.jdbc.Driver");
			// 打开一个连接
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			// 执行 SQL 查询
			stmt = conn.createStatement();
			String sql;
			sql = "INSERT INTO plan (userId,content) VALUES ('"+id+"','"+item+"')";
			stmt.executeUpdate(sql);
			PrintWriter out = response.getWriter();
			out.println(":) 保存成功！");
			// 完成后关闭
			stmt.close();
			conn.close();
		} catch(SQLException se) {
			// 处理 JDBC 错误
			se.printStackTrace();
		} catch(Exception e) {
			// 处理 Class.forName 错误
			e.printStackTrace();
		}finally{
			// 最后是用于关闭资源的块
			try{
				if(stmt!=null)
				stmt.close();
			}catch(SQLException se2){
			}
			try{
				if(conn!=null)
				conn.close();
			}catch(SQLException se){
				se.printStackTrace();
			}
		}
	}

}
