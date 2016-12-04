package edu.hzu.javaweb.labs.se1414080902135;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.Build;
@WebServlet(name="User_Session",urlPatterns="/User_Session")
public class User_Session extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws 
	ServletException, IOException {
		HttpSession session=request.getSession();
		Object name=session.getAttribute("user");
		if(name==null){
			Build build=new Build();
			Map<String,String> map=build.querys();
			session.setAttribute("user", map);
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws 
	ServletException, IOException {
		doGet(request, response);
	}

}
