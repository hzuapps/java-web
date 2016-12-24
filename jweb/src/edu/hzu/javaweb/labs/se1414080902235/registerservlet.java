package web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class registerservlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public registerservlet() {
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
          String userName=request.getParameter("username");
          String userPwd=request.getParameter("userpwd");
          String userPwd1=request.getParameter("userpwd1");
          String userSex=request.getParameter("usersex");
          request.setAttribute("usern",userName);
          request.setAttribute("userp",userPwd);
          request.setAttribute("users",userSex);
          request.setAttribute("power", "0");
          if(userName.length()<=0)
        	  request.getRequestDispatcher("/error.jsp").forward(request, response);
          else if(userName.length()<6||userPwd.length()<6)
        	  request.getRequestDispatcher("/error.jsp").forward(request, response);
          else if(!(userPwd).equals(userPwd1))
        	  request.getRequestDispatcher("/error.jsp").forward(request, response);
          else
          {
        	  request.setAttribute("power", "1");
        	  request.getRequestDispatcher("/input.jsp").forward(request, response);
          }
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
