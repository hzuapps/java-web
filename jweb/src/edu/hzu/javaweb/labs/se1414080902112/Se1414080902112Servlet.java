package edu.hzu.javaweb.labs.se1414080902112;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/1414080902112")

public class Se1414080902112Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	public Se1414080902112Servlet() {
		super();
	}

	
	public void destroy() {
		super.destroy(); 
		
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>×¢²áÒ³Ãæ</TITLE></HEAD>");
		out.println("  <BODY>");
		out.println("ÐÅÏ¢×¢²á");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}


	public void init() throws ServletException {
		// Put your code here
	}

}
