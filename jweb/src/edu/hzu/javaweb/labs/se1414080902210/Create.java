package edu.hzu.javaweb.labs.se1414080902210;

import java.io.IOException;

import edu.hzu.javaweb.labs.se1414080902210.Score;

import java.io.PrintWriter;

import javax.inject.Scope;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Create extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public Create() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();


	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		Score.add(new Score("Java web", 3));
		Score.add(new Score("操作系统", 3));
		Score.add(new Score("计算机网络", 2));
		Score.add(new Score("软件工程导论", 1));
		Score.add(new Score("高等数学", 5));
		HttpSession subjectsSession=request.getSession(true);
		
		subjectsSession.setAttribute("gradesList", score);
		response.sendRedirect("1414080902210/showscoreinfo.jsp");
	}


	public void init() throws ServletException {
		// Put your code here
	}

}
