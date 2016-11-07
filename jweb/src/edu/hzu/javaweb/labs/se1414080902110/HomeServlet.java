package edu.hzu.javaweb.labs.se1414080902110;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Messay;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "HomeServlet", urlPatterns = { "/homepage" })
public class HomeServlet extends HttpServlet {
	private Connection conn1, conn2;
	private PreparedStatement pstmt1, pstmt2;
	private ResultSet rs1, rs2;

	public HomeServlet() {
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
			JDBCconnection connection = new JDBCconnection();
			conn1 = connection.connection();
			conn2 = connection.connection();
			String sql1 = "select * from essay where is_del=1";
			pstmt1 = conn1.prepareStatement(sql1);
			rs1 = pstmt1.executeQuery();
			List<Messay> messayList = new ArrayList<Messay>();
			while (rs1.next()) {
				String sql2 = "select user_name,user_photo from user where user_id=?";
				pstmt2 = conn2.prepareStatement(sql2);
				pstmt2.setInt(1, rs1.getInt("user_id"));
				rs2 = pstmt2.executeQuery();
				if (rs2.next()) {
					messayList.add(new Messay(rs1.getInt("essay_id"),
							rs1.getString("essay_title"), 
							rs1.getString("classify"), 
							rs1.getInt("click"),
							rs2.getString("user_name")));
				}
			}
			request.setAttribute("messay", messayList);
			request.getRequestDispatcher("/index/homepage.jsp").forward(
					request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
