package edu.hzu.javaweb.labs.se1414080902215;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/Se1414080902215Servlet")
public class Se1414080902215Servlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
		
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		String username = request.getParameter("username");  
	    String password = request.getParameter("password");  
	    String User1="abcd";
	    String Pwd1="1234";
	    String msg="µÇÂ¼³É¹¦£¡";
	    HttpSession session=request.getSession(true);
	    if(username.equals(User1)&&password.equals(Pwd1))
	    {
	    	request.setAttribute("message", msg);
	    	session.setAttribute("message", msg);
	    	request.getRequestDispatcher("/index.jsp").forward(request, response);
	    	
	    }
	    else
	    { 
	    	request.getRequestDispatcher("/failure.jsp").forward(request, response); 
	    }
	}

}
