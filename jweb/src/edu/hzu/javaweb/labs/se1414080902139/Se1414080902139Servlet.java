package edu.hzu.javaweb.labs.se1414080902139;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletConfig;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/1414080902139")
public class Se1414080902139Servlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public Se1414080902139Servlet() {
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
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String ful = request.getParameter("fullnameinfo");
		String sex = request.getParameter("sexinfo");
		String grade = request.getParameter("gradeinfo");
		String pro = request.getParameter("proinfo");
		String tel = request.getParameter("telinfo");
		String email = request.getParameter("emailinfo");
		String hobby = request.getParameter("hobbyinfo");
		String spe = request.getParameter("speinfo");
		String exp = request.getParameter("expinfo");
		
		String message="";

		request.setAttribute("outputful", ful);
		request.setAttribute("outputsex", sex);
		request.setAttribute("outputgrade", grade);
		request.setAttribute("outputpro", pro);
		request.setAttribute("outputtel", tel);
		request.setAttribute("outputemail", email);
		request.setAttribute("outputhobby", hobby);
		request.setAttribute("outputspe", spe);
		request.setAttribute("outputexp", exp);
		request.getRequestDispatcher("/inforeceive.jsp").forward(request, response);
//		response.setContentType("text/html");
//		PrintWriter out = response.getWriter();
//		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
//		out.println("<HTML>");
//		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
//		out.println("  <BODY>");
//		out.print("    This is ");
//		out.print(this.getClass());
//		out.println(", using the GET method");
//		out.println("  </BODY>");
//		out.println("</HTML>");
//		out.flush();
//		out.close();
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
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String fullname = request.getParameter("fullnameinfo");
		String message="";
		if(fullname.length()<=0){
			message="用户名不能为空";
		}
		request.setAttribute("M", message);
		request.getRequestDispatcher("/info.jsp").forward(request, response);
//		response.setContentType("text/html");
//		PrintWriter out = response.getWriter();
//		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
//		out.println("<HTML>");
//		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
//		out.println("  <BODY>");
//		out.print("    This is ");
//		out.print(this.getClass());
//		out.println(", using the POST method");
//		out.println("  </BODY>");
//		out.println("</HTML>");
//		out.flush();
//		out.close();
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