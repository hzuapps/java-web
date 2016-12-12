package edu.hzu.javaweb.labs.se1406070302213;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
//import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Se1406070302213Servlet extends HttpServlet {
	
	public Se1406070302213Servlet() {
 		super();
 	}
	
	public void destroy() {
 		super.destroy(); // Just puts "destroy" string in log
 		// Put your code here
 	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
 			throws ServletException, IOException {

		
		String pw = request.getParameter("pw");
		HttpSession session = request.getSession();
		session.setAttribute("pw", pw);
		
		JdbcConnect util = new JdbcConnect();
		List<Userinfo> userinfos = util.getUserinfo();
		request.setAttribute("userinfos", userinfos);
		request.getRequestDispatcher("/index").forward(request, response);
	}		
}
