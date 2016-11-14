package edu.hzu.javaweb.labs.se1414080902236;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SeInfoCheck extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public SeInfoCheck() {
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

		
		String name ="";
		String value="";
		request.setCharacterEncoding("UTF-8");
		Enumeration params = request.getParameterNames();
		ArrayList<String> carInfo = new ArrayList<String>();
		while(params.hasMoreElements()){
			name=(String)params.nextElement();
			value=(String)request.getParameter(name);
			carInfo.add(value);		
		}
		request.setAttribute("carMsg", carInfo);
		ArrayList<String> carInfoName = new ArrayList<String>();
		carInfoName.add("厂商");
		carInfoName.add("级别");
		carInfoName.add("发动机");
		carInfoName.add("变速箱");
		carInfoName.add("长*宽*高(mm)");
		carInfoName.add("车身结构");
		carInfoName.add("最高车速(km/h)");
		carInfoName.add("官方0-100km/h加速(s)");
		carInfoName.add("工信部综合油耗(L/100km)");
		request.setAttribute("carname", carInfoName);
		request.getRequestDispatcher("/InfoCheck.jsp").forward(request, response);
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

		doGet(request,response);
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
