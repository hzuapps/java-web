package edu.hzu.javaweb.labs.se1414080902201;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
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
 * Servlet implementation class LoginServlet
 */
@WebServlet(name="LoginServlet",urlPatterns="/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// JDBC 驱动名及数据库 URL
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
	static final String DB_URL = "jdbc:mysql://localhost:3306/todox";
	
	// 数据库的用户名与密码
	static final String USER = "root";
	static final String PASS = ""; 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("login.jsp");
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
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");
        if(email.equals("")){
        	request.setAttribute("tip", "邮箱不能为空！");                                        
            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");   
            dispatcher.forward(request, response);
            return;
        }
        if(password.equals("")){
        	request.setAttribute("tip", "密码不能为空！");                                        
            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");   
            dispatcher.forward(request, response);
            return;
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
			sql = "SELECT * FROM user WHERE email='"+email+"'";
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()){
				id = rs.getString("id");
				String pass = rs.getString("password");
				System.out.println(id);
				if(!password.equals(pass)){
					request.setAttribute("tip", "密码错误！");                                        
		            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");   
		            dispatcher.forward(request, response);
		            return;
				}
			}else{
				request.setAttribute("tip", "该邮箱未注册！");                                        
	            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");   
	            dispatcher.forward(request, response);
	            return;
			}
			
			// 完成后关闭
			rs.close();
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

        //创建 Cookie
 		Cookie cookie_email = new Cookie("email",email);
 		Cookie cookie_id = new Cookie("id",id);
 		if(remember != null){
 			// 设置过期日期为30天后
 	 		cookie_email.setMaxAge(60*60*24*30);
 	 		cookie_id.setMaxAge(60*60*24*30);
 		}else{
 			//设置过期时间为1小时
 			cookie_email.setMaxAge(60*60);
 			cookie_id.setMaxAge(60*60);
 		}
 		// 在响应头中 Cookie
 		response.addCookie(cookie_email);
 		response.addCookie(cookie_id);
 		response.sendRedirect("index");


	}

}
