package edu.hzu.javaweb.labs.se1414080902210;

import java.io.IOException;

import edu.hzu.javaweb.labs.se1414080902210.Student;
import edu.hzu.javaweb.labs.se1414080902210.StudentDAO;

import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
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


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");


	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		@SuppressWarnings("unused")
		PrintWriter out = response.getWriter();
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String sex = request.getParameter("sex");
		int age = Integer.parseInt(request.getParameter("age"));
		float weight = Float.parseFloat(request.getParameter("weight"));
		float hight = Float.parseFloat(request.getParameter("hight"));
		System.out.println(id);
		System.out.println(name);
		System.out.println(sex);
		System.out.println(age);
		System.out.println(weight);
		System.out.println(hight);
		
		Student student = new Student();
		student.setId(id);
		student.setName(name);
		student.setSex(sex);
		student.setAge(age);
		student.setWeight(weight);
		student.setHight(hight);
		StudentDAO _create = new StudentDAO();
		RequestDispatcher dispatcher = null;
		try {
			if(_create.create(student)!= null) 
			{
				dispatcher = request.getRequestDispatcher("/success.jsp");
				dispatcher.forward(request, response);
			}else {
				dispatcher = request.getRequestDispatcher("/error.jsp");
				dispatcher.forward(request, response);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
 
	public void init() throws ServletException {
		// Put your code here
	}

}
