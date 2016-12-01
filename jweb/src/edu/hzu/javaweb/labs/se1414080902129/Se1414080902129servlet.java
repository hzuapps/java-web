package edu.hzu.javaweb.labs.se1414080902129;

import java.awt.List;

import java.io.IOException;


import java.io.PrintWriter;
import java.util.ArrayList;

import javax.jws.WebService;
import javax.servlet.ServletException;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/1414080902129")
public class Se1414080902129servlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public Se1414080902129servlet() {
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
        request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8"); 
		String stuname=request.getParameter("stuname");
		String stuphone=request.getParameter("stuphone");
		String expressname=request.getParameter("expressname");
		String stuadd=request.getParameter("stuadd");
		String d=request.getParameter("d");
     
		
	  
	    request.setAttribute("stuname", stuname);
	    request.setAttribute("stuadd", stuadd);
		request.setAttribute("d",d);
	    
	    request.setAttribute("stuphone", stuphone);
	    request.setAttribute("expressname", expressname);
		request.getRequestDispatcher("/web/output.jsp").forward(request,response);
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
