package edu.hzu.javaweb.labs.se1414080902112;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.hzu.javaweb.labs.se1414080902112.User;

public class SetUser extends HttpServlet {

	 
	public SetUser() {
		super();
	}

	
	public void destroy() {
		super.destroy(); 
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("UTF-8");		
		String name=request.getParameter("name");
        String sex=request.getParameter("sex");
		String id=request.getParameter("id");
		String brithdate=request.getParameter("brithdate");
		String information=request.getParameter("information");
	  List<User> Users=new ArrayList<User>();
	  Users.add(new User(name,sex,id,brithdate,information));
	   request.setAttribute("User", Users);
	   request.getRequestDispatcher("show.jsp").forward(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request,response);
	}

	
	public void init() throws ServletException {
		
	}

}
