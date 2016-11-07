package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jweb.bean;

public class Servlet extends HttpServlet {

	private static final String Weight = null;
	private static final String Height = null;
	private static final String Weight1 = null;
	private static final String Height1 = null;

	/**
	 * Constructor of the object.
	 */
	public Servlet() {
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
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String cls = request.getParameter("cls");
		double age =(double) Integer.valueOf(request.getParameter("age"));
		String cls1 = request.getParameter("cls1");
		double age1 =(double) Integer.valueOf(request.getParameter("age1"));
		ArrayList<bean> listz=new ArrayList<bean>();
		bean x = new bean(cls,age);
		bean y = new bean(cls1,age1);
		double weight1;
		double height1;
		double weight;
		double height;
		x.setHeight(cls, age);
		x.setWeight(cls, age);
		y.setHeight(cls1, age1);
		y.setWeight(cls1, age1);
		weight = x.getWeight();
		height = x.getHeight();
		weight1 = y.getWeight();
		height1 = y.getHeight();
		HttpSession session=request.getSession(true);
		// +			session.setAttribute("list", list);
		request.setAttribute("Weight", weight);
		request.setAttribute("Height", height);
		request.setAttribute("Weight1", weight1);
		request.setAttribute("Height1", height1);
		listz.add(x);
		listz.add(y);
		request.setAttribute("list", listz);
		System.out.println(listz);
		request.getRequestDispatcher("abc.jsp").forward(request, response);
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
