package edu.hzu.javaweb.labs.se1414080902223;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.hzu.javaweb.labs.se1414080902223.ScoreDao;

import edu.hzu.javaweb.labs.se1414080902223.Score;
import edu.hzu.javaweb.labs.se1414080902223.DbUtil;

@WebServlet("/Insert")
public class Insert extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public Insert() {
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
		PrintWriter out = response.getWriter();
		System.out.println("get«Î«Û≥…π¶!");
		
		if(request.getParameter("stuid")==""||request.getParameter("classno")==""||request.getParameter("grade")==""){
			request.getRequestDispatcher("error.jsp").forward(request, response);
			
		}else{
			
		
		int stuid = Integer.parseInt(request.getParameter("stuid"));
		int classno = Integer.parseInt(request.getParameter("classno"));
		int grade = Integer.parseInt(request.getParameter("grade"));
		
	
		Score sco = new Score();
		sco.setStuid(stuid);
		sco.setClassno(classno);
		sco.setGrade(grade);
		
		
		ScoreDao dao = new ScoreDao();
		try {
			dao.create(sco);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.getRequestDispatcher("success.jsp").forward(request, response);
		
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