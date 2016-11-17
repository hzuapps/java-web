package com.imooc.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {
	public LoginServlet() {
		super();
	}
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		if("admin".equals(username) && "admin".equals(password)){
			HttpSession session=request.getSession();
			session.setAttribute("username", username);
			response.sendRedirect(request.getContextPath()+"/success.jsp");
		}else{
			response.sendRedirect(request.getContextPath()+"/fail.jsp");
		}
		
	}

	
	public void init() throws ServletException {
		// Put your code here
	}

}
