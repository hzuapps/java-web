package edu.hzu.javaweb.labs.se1414080902225;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import MainController.SqlHelper;
import edu.hzu.javaweb.bean.Grades;

@WebServlet(urlPatterns="/UpdateGrades")
public class AddGrades extends HttpServlet {
	
	public AddGrades() {
		super();
	}

	
	public void destroy() {
		super.destroy(); 
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("I'm calling and i will be send to Show page");
		response.sendRedirect("1414080902225/ShowAssessmentInfo.jsp");

		
	}

	
	@SuppressWarnings("unchecked")
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		HttpSession hs=request.getSession(true);
		List<Grades> gl=(List<Grades>)hs.getAttribute("gradesList");
		int len=gl.size();
		
		
		String[] subjectGrades=new String[len];
		int i=0;
		try {
			
			while(i<len)
			{
				String key=new StringBuffer().append("subject").append(((Integer)i).toString()).toString();
				subjectGrades[i]=request.getParameter(key);
				i++;
			}
			
			int k=0;
			String sqltext="update coursescore set FinalScore=? where CourseName=?";
			int affectLine=0;
			for (Grades grade : gl) 
			{
				grade.setGrade(Double.parseDouble(subjectGrades[k++]));
				Object args[]=new Object[2];
				args[0]=grade.getGrade();
				args[1]=grade.getCourseName();
				affectLine += new SqlHelper().executeUpdate(sqltext, args);
			}
			if (affectLine>0) 
			{
				System.out.println("成功更新"+Integer.toString(affectLine)+"条数据");
			}
			hs.setAttribute("gradesList", gl);
		} catch (Exception e) {
			System.out.print(e.getMessage());
		}
		
		response.sendRedirect("1414080902225/ShowAssessmentInfo.jsp");
		
	}

	
	public void init() throws ServletException {
		
	}
}
