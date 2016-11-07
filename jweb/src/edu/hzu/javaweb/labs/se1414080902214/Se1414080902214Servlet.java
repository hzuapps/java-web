package edu.hzu.javaweb.labs.se1414080902214;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("1414080902214")
public class Se1414080902214Servlet extends HttpServlet {
	
	public Se1414080902214Servlet() {
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
		
		//获取参数—�?标题、内�?
		String title = request.getParameter("count");
		String content = request.getParameter("password");
		request.setAttribute("msg", "操作成功");
		request.getRequestDispatcher("/index.jsp").forward(request, response);;
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
