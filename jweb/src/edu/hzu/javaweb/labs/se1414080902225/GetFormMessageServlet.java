package edu.hzu.javaweb.labs.se1414080902225;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet(value="/GetFormMessageServlet")
public class GetFormMessageServlet extends HttpServlet {


	public GetFormMessageServlet() {
		super();
	}

	
	public void destroy() {
		super.destroy(); 
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			String user=request.getParameter("user");
			String pwd=request.getParameter("pwd");
			String role=request.getParameter("login");
			HttpSession loginSession=request.getSession(true);
			loginSession.setAttribute("user",user);
			loginSession.setAttribute("pwd", pwd);
			loginSession.setAttribute("role", role);
			
			response.sendRedirect("1414080902225/Message.jsp");
		
	}

	
	public void init() throws ServletException {
	}
}
