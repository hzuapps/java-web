package edu.hzu.javaweb.labs.se1414080902110;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name="EditEssayServlet",urlPatterns={"/edit"})
public class EditEssayServlet extends HttpServlet {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	int user_id;
	public EditEssayServlet() {
		super();
	}

	public void destroy() {
		super.destroy(); 
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String title = request.getParameter("essay_title");
			String content = request.getParameter("essay_content");
			String classify = request.getParameter("classify");
			JDBCconnection connection = new JDBCconnection();
			conn= connection.connection();
			String userName = (String) request.getSession().getAttribute("loginUserAccount");
			String sql1 = "select user_id from user where user_account =?";
			pstmt = conn.prepareStatement(sql1);
			pstmt.setString(1, userName);
			rs = pstmt.executeQuery();
			while(rs.next()){
				user_id = rs.getInt("user_id");
			}
			String sql2 = "insert into essay(essay_title,essay_content,user_id,classify) values(?,?,?,?)";
			pstmt = conn.prepareStatement(sql2);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, user_id);
			pstmt.setString(4, classify);
			pstmt.executeUpdate();
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	public void init() throws ServletException {
		// Put your code here
	}

}
