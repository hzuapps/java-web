package edu.hzu.javaweb.labs.se1414080902223;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/1414080902223")
public class Se1414080902223Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Se1414080902223Servlet() {
		super();
	}

	public void init(ServletConfig config) throws ServletException {
		
	}

	public void destroy() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		HttpSession session=request.getSession();
		PrintWriter out = response.getWriter();
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		
		if(username.equals("23")&&password.equals("11"))
		{
			session.setAttribute("username", username);
			
			out.println(1);
		}
		else 
			out.print(0);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
		
	}

}
