package edu.hzu.javaweb.labs.se1414080902210;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.hzu.javaweb.labs.se1414080902210.Student;
import edu.hzu.javaweb.labs.se1414080902210.StudentDAO;

public class Find_sub extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public Find_sub() {
		super();
	}


	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		//获取查询的学号
		String name = request.getParameter("name");
		String sex = request.getParameter("sex");
		StudentDAO _findsub = new StudentDAO();
		Student s = new Student();
		s.setName(name);
		s.setSex(sex);
		/*String sex1 = request.getParameter("sex1");
		String sex2 = request.getParameter("sex2");
		int age1 = Integer.parseInt(request.getParameter("age1"));
		int age2 = Integer.parseInt(request.getParameter("age2"));
		float weight1 = Float.parseFloat(request.getParameter("weight1"));
		float weight2 = Float.parseFloat(request.getParameter("weight2"));
		float hight1 = Float.parseFloat(request.getParameter("hight1"));
		float hight2 = Float.parseFloat(request.getParameter("hight2"));*/
		try {
			Student student = _findsub.find(s);//实例化返回值
			if(student!=null){
				 out.println("<center>");
		    	 out.println("查询结果");
		    	 out.println("<table border=1>");
		    	
		    	 out.println(" <tr><td>学号</td> <td>姓名</td> <td>性别</td><td>年龄</td><td>体重</td><td>身高</td></tr>");
		    	 out.println("<tr>");
		    	 out.println("<td>");
		    	 out.println(student.getId());
		    	 out.println("</td>");
		    	 
		    	 out.println("<td>");
		    	 out.println(student.getName());
		    	 out.println("</td>");
		    	 
		    	 out.println("<td>");
		    	 out.println(student.getSex());
		    	 out.println("</td>");
		    	 
		    	 out.println("<td>");
		    	 out.println(student.getAge());
		    	 out.println("</td>");
		    	 
		    	 out.println("<td>");
		    	 out.println(student.getWeight());
		    	 out.println("</td>");
		    	 
		    	 out.println("<td>");
		    	 out.println(student.getHight());
		    	 out.println("</td>");
		    	 out.println("</tr>");
		    	 out.println("</table>");
		    	 out.println("</center>");
			}else{
				 out.println("查询不到该学生");
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
