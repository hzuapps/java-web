package edu.hzu.javaweb.labs.se1414080902226;

import java.io.IOException;


import java.io.PrintWriter;

import javax.jws.WebService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;



@WebServlet(name="helloWorldServlet",urlPatterns="/1414080902226")
public class Qiandao extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public Qiandao() {
		super();
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
		ReturnInfo ri=new ReturnInfo();
		ri.setIsSuccess("µÇÂ½³É¹¦");
		ri.setZhanghao(request.getParameter("count"));
		request.setCharacterEncoding("UTF-8");
		request.setAttribute("returninfo", JSONArray.toJSON(ri));
		request.getRequestDispatcher("/index.jsp").forward(request, response);
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

}
