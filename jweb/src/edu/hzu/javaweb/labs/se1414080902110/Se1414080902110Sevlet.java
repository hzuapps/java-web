package edu.hzu.javaweb.labs.se1414080902110;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import edu.hzu.javaweb.labs.se1414080902110.JDBCconnection;

public class Se1414080902110Sevlet extends HttpServlet {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public Se1414080902110Sevlet() {
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
		String account = request.getParameter("account");
		String password = request.getParameter("password");
		try {
			JDBCconnection connnection = new JDBCconnection();
			conn = connnection.connection();
			String sql = "select user_id from user where user_account =? and user_password =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, account);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				request.getSession().setAttribute("loginUserAccount", account);
				request.getRequestDispatcher("/essay.jsp").forward(request,
						response);
			} else {
				request.getRequestDispatcher("/error.jsp").forward(request,
						response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
