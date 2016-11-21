package edu.hzu.javaweb.labs.se1414080902205;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/1414080902205")
public class Se1414080902205Servlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public Se1414080902205Servlet() {
		super();
	}


	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

//		response.setContentType("text/html");
//		PrintWriter out = response.getWriter();
//		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
//		out.println("<HTML>");
//		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
//		out.println("  <BODY>");
//		out.print("    This is ");
//		out.print(this.getClass());
//		out.println(", using the GET method");
//		out.println("  </BODY>");
//		out.println("</HTML>");
//		out.flush();
//		out.close();
		doPost(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		request.setCharacterEncoding("gb2312");
		response.setCharacterEncoding("gb2312");
		PrintWriter out = response.getWriter();
		String Account = new String(request.getParameter("account"));
		String Amount = new String(request.getParameter("amount"));
//		out.print(Account);
//		out.print(Amount);
		if (Account.equals("")) {
			out.println("账号不能为空");
		} else if (Amount.equals("")) {
			out.println("转账金额不能为空");
		} else {
			boolean flat = true;
			char[] str=Account.toCharArray();
			for (int i = 0;i < Account.length();i++) {
				int x = str[i] - '0';
				if (!(x >= 0 && x <= 9)) {
					out.println("请输入正确的账号");
					flat = false;
					break;
				}
			}
			if (flat) {
				char[] sstr =Amount.toCharArray();
				for (int i = 0;i < Amount.length();i++) {
					int x = sstr[i] - '0';
					if (!(x >= 0 && x <= 9)) {
						out.println("请输入正确的转账金额");
						flat = false;
						break;
					}
				}
			}
			if (flat) {
				Connection conn = null;
				PreparedStatement stmt = null;
		        DBBean db = new DBBean();
				try {
			        conn = db.getConnection();
			        String sql = "insert into transfer values(?,?)";
			        stmt = db.getPreparedStatement(sql);
			        stmt.setString(1,Account);
			        stmt.setString(2,Amount);
			        stmt.executeUpdate();
			        db.closeResource(conn,null,stmt);
				} catch (SQLException e) {
					e.printStackTrace();
				}
				out.println("转账成功");
			}
		}
//		String Account = "1414080902205";
//		String Amount = "1414080902205";
//		out.println(Account);
//		out.println(Amount);
//		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
////		out.println("<HTML>");
////		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
////		out.println("  <BODY>");
////		out.print("    This is ");
////		out.print(this.getClass());
////		out.println(", using the POST method");
////		out.println("  </BODY>");
////		out.println("</HTML>");
////		out.flush();
////		out.close();
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
