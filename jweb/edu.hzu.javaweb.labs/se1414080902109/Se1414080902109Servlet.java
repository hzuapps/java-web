package se1414080902109;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Se1414080902109Servlet extends HttpServlet {

	private static final Object s1 = null;

	/**
	 * Constructor of the object.
	 */
	public Se1414080902109Servlet() {
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

		doPost(request,response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @param s 
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response, Object s)
			throws ServletException, IOException {
		try{

		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String[] list=request.getParameterValues("list");
		String s1="";
		if(list!=null){
		for(int i=0;i<list.length;i++){
			s1+=list[i]+" ";
		}
		}
		else{
			s1="ÄãÔÝÎÞµã²Í£¬Çëµã²Í";
		}
		}catch(Exception e){}
		request.setAttribute("out", s1);
		request.getRequestDispatcher("/index.jsp").forward(request,response);
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
