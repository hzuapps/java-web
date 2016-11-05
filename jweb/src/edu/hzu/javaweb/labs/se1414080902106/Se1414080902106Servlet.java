package edu.hzu.javaweb.labs.se1414080902106;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Se1414080902106Servlet extends HttpServlet {
	
	public Se1414080902106Servlet() {
		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//设置译码方式
		request.setCharacterEncoding("utf-8");
		
		//获取参数——标题、内容
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		//将标题和内容放到session里
		HttpSession session = request.getSession();
		session.setAttribute("title", title);
		session.setAttribute("content", content);
		
		//将页面跳转到index.jsp
		response.sendRedirect("index.jsp");
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
