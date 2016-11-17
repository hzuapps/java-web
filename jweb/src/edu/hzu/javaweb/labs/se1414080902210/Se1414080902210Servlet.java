package edu.hzu.javaweb.labs.se1414080902210;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import edu.hzu.javaweb.labs.se1414080902210.Score;

@SuppressWarnings("unused")
@WebServlet("/1st")
public class Se1414080902210Servlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public Se1414080902210Servlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); 

	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		response.sendRedirect("1414080902210/showscoreinfo.jsp");
		out.flush();
		out.close();
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		List<Score> gl=(List<Score>)hs.getAttribute("scoreList");
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
			for (Score grade : gl) {
				grade.getScore(Double.parseDouble(subjectGrades[k++]));
				
			}
			hs.setAttribute("gradesList", gl);
		} catch (Exception e) {
			System.out.print(e.getMessage());
		}
		
		response.sendRedirect("1414080902210/showscoreinfo.jsp");
		
	}



	public void init(ServletConfig config) throws ServletException {
		
		// Put your code here
	}

}
