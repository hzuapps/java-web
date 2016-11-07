package edu.hzu.javaweb.labs.se1414080902129;

import java.io.IOException;


import java.io.PrintWriter;

import javax.jws.WebService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/14140809021292")
public class Se1414080902129servlet2 extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public Se1414080902129servlet2() {
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
		response.setContentType("text/html;charset=utf-8"); 
		String stuname=request.getParameter("stuname");
		String stuphone=request.getParameter("stuphone");
		String expressname=request.getParameter("expressname");
		String stuadd=request.getParameter("stuadd");
		String info="»¶Ó­Äã"+stuname+"!";
		
	    request.setAttribute("outputMessage",info);
	    request.setAttribute("stuname", stuname);
	    request.setAttribute("stuadd", stuadd);
	    request.setAttribute("stuphone", stuphone);
	    request.setAttribute("expressname", expressname);
		request.getRequestDispatcher("/web/express_send.jsp").forward(request,response);
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
		doGet(request, response);
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
