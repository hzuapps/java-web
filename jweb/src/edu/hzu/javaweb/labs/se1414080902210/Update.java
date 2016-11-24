package edu.hzu.javaweb.labs.se1414080902210;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.hzu.javaweb.labs.se1414080902210.StudentDAO;
import edu.hzu.javaweb.labs.se1414080902210.Student;

public class Update extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public Update() {
		super();
	}

	public void destroy() {
		super.destroy();

	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String sex = request.getParameter("sex");
		int age = Integer.parseInt(request.getParameter("age"));
		float weight = Float.parseFloat(request.getParameter("weight"));
		float hight = Float.parseFloat(request.getParameter("hight"));
		
		Student student = new Student();
		student.setId(id);
		student.setName(name);
		student.setSex(sex);
		student.setAge(age);
		student.setWeight(weight);
		student.setHight(hight);
		
		StudentDAO up = new StudentDAO();
		try {
			if(up.update(student)>=1){
				request.getRequestDispatcher("/success.jsp").forward(request, response);
			}else{
				request.getRequestDispatcher("/error.jsp").forward(request, response);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public void init() throws ServletException {

	}

}
