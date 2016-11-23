package edu.hzu.javaweb.labs.se1414080902210;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.hzu.javaweb.labs.se1414080902210.StudentDAO;
import edu.hzu.javaweb.labs.se1414080902210.Student;

public class Delete extends HttpServlet {

	private static final long serialVersionUID = 1L;


	public Delete() {
		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the GET method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		//获取要删除的学号
		int id = Integer.parseInt(request.getParameter("id"));
		StudentDAO _del = new StudentDAO();
		Student s = new Student();
		s.setId(id);
		/*String sex1 = request.getParameter("sex1");
		String sex2 = request.getParameter("sex2");
		int age1 = Integer.parseInt(request.getParameter("age1"));
		int age2 = Integer.parseInt(request.getParameter("age2"));
		float weight1 = Float.parseFloat(request.getParameter("weight1"));
		float weight2 = Float.parseFloat(request.getParameter("weight2"));
		float hight1 = Float.parseFloat(request.getParameter("hight1"));
		float hight2 = Float.parseFloat(request.getParameter("hight2"));*/
		try {
			if(_del.remove(s)>0){
				request.getRequestDispatcher("/success.jsp").forward(request, response);
			}else{
				request.getRequestDispatcher("/error.jsp").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	public void init() throws ServletException {
		// Put your code here
	}

}
