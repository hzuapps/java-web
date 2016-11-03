package edu.hzu.javaweb.labs.se1414080902135;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.Build;
@WebServlet("/User_Session")
public class User_Session extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws 
	ServletException, IOException {
		//用户刷新页面时，自动更新session
		Build build=new Build();
		List<String> li=build.querys();
		HttpSession sessin=request.getSession();
		sessin.setAttribute("user_id", li);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws 
	ServletException, IOException {
		doGet(request, response);
	}

}
