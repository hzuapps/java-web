package edu.hzu.javaweb.labs.se1414080902210;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.hzu.javaweb.labs.se1414080902210.StudentDAO;
import edu.hzu.javaweb.labs.se1414080902210.Student;

public class Find_Edit extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public Find_Edit() {
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
		PrintWriter out = response.getWriter();
		String name = request.getParameter("name");
		String sex = request.getParameter("sex");
		StudentDAO _fe = new StudentDAO();
		Student s = new Student();
		s.setName(name);
		s.setSex(sex);
		
		try {
			Student student = _fe.find(s);
			if(student != null){
				request.setAttribute("result", student);//将查询结果保存到request对象中
				request.getRequestDispatcher("/update_stu_edit.jsp").forward(request, response);
			}else {
				out.println("找不到该学生！");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public void init() throws ServletException {

	}

}
