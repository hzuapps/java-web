package edu.hzu.javaweb.labs.se1414080902113;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/1414080902113")
public class Se1414080902113Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Se1414080902113Servlet() {
		super();
	}

	public void init(ServletConfig config) throws ServletException {
		
	}

	public void destroy() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	       PrintWriter out=response.getWriter();
	       response.setContentType("text/html;charset=utf-8");
	       out.println("<HTML>");
	       out.println("  <HEAD><TITLE>第1个Servlet示例</TITLE></HEAD>");
	       out.println("<BODY>");
	       out.println("测试成功!");
	       out.println("</BODY>");
	       out.println("</HTLM>");
	       out.flush();
	       out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
