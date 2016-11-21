package edu.hzu.javaweb.labs.se1414080902113;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class BookServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public BookServlet() {
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

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		String sname=request.getParameter("name");
		String swriter=request.getParameter("writer");
		String sdate=request.getParameter("date");
		String spublish=request.getParameter("publish");
		String smain=request.getParameter("main"); 
	    String sql="Insert into book_info(name,writer,date,publish,main) values('"+sname+"','"+swriter+"','"+sdate+"','"+spublish+"','"+smain+"')";
		Util run=new Util();
		int n=run.insertSQL(sql);
	    if(n>=1) out.println("书籍添加成功"); else  out.println("书籍添加失败");

	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
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
