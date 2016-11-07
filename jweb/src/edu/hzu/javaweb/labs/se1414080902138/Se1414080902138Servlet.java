package edu.hzu.javaweb.labs.se1414080902138;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Se1414080902138Servlet extends HttpServlet {

	/**
		 * Constructor of the object.
		 */
	public Se1414080902138Servlet() {
		super();
	}

	/**
		 * Destruction of the servlet. <br>
		 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
		 * The doGet method of the servlet. <br>
		 *
		 * This method is called when a form has its tag value method equals to get.
		 * 
		 * @param request the request send by the client to the server
		 * @param response the response send by the server to the client
		 * @throws ServletException if an error occurred
		 * @throws IOException if an error occurred
		 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String name=request.getParameter("Username");
	String pwd=request.getParameter("UserPwd");
	PrintWriter out = response.getWriter();
	if (("HCJ".equals(name))&&"123".equals(pwd)) {
			request.getRequestDispatcher("/add.jsp").forward(request,response);
		} else if (name.equals("")) {
			            out.println("<h3 align=center>");
			            out.println("<br><br><br><br><br>");
			 			out.println("The User name can not be empty.");
			 			out.println("</h3>");
			 		} else if (pwd.equals("")) {
			 			out.println("<h3 align=center>");
			 			out.println("<br><br><br><br><br>");
			 			out.println("The Password can not be empty.");
			 			out.println("</h3>");}	
	else  {			
			out.println("<h3 align=center>");
			out.println("<br><br><br><br><br>");
			out.println(" The username and password you entered are not available,Please try again ");
			out.println("</h3>");
}
	}

	/**
		 * The doPost method of the servlet. <br>
		 *
		 * This method is called when a form has its tag value method equals to post.
		 * 
		 * @param request the request send by the client to the server
		 * @param response the response send by the server to the client
		 * @throws ServletException if an error occurred
		 * @throws IOException if an error occurred
		 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
 		out.println("<HTML>");
 		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
 		out.println("  <BODY >");
 		out.println("<h3 align=center>");
 		out.println("<br><br><br><br><br>");
 		out.println("  Hello,HCJ! ");
 		out.println("<br><br>");
 		out.println("The message has been updated!");
 		out.println("</h3>");
 		out.println("  </BODY>");
 		out.println("</HTML>");
 		out.flush();
 		out.close();
	}

	/**
		 * Initialization of the servlet. <br>
		 *
		 * @throws ServletException if an error occurs
		 */
	public void init() throws ServletException {
		// Put your code here
	}

}