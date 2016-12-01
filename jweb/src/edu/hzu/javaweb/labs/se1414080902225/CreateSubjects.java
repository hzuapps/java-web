package edu.hzu.javaweb.labs.se1414080902225;
import edu.hzu.javaweb.bean.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import MainController.SqlHelper;

@WebServlet(urlPatterns="/InitSubjectInfo")
public class CreateSubjects extends HttpServlet {
	
	public CreateSubjects() {
		super();
	}

	
	public void destroy() {
		super.destroy(); 
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Grades> grades=new ArrayList<Grades>();
		String sqltext="select CourseName,CourseCredit from coursescore";
		ResultSet rset= new SqlHelper().executeQueryRS(sqltext, null);
		try {
			while(rset.next())
			{
				String coursrnameString=rset.getString(1);
				double credit= Double.parseDouble(rset.getString(2));
				grades.add(new Grades(coursrnameString, credit));
			}
		} catch (SQLException e) {
			
			System.out.print(e.getMessage());
		}
		/*
		grades.add(new Grades("数据库概念", 3));
		grades.add(new Grades("操作系统", 3));
		grades.add(new Grades("计算机网络", 2));
		grades.add(new Grades("博弈论基础", 1));
		grades.add(new Grades("高等数学", 5));
		grades.add(new Grades("概率论基础", 2));
		grades.add(new Grades("汇编语言", 2));
		grades.add(new Grades("大学体育", 2));
		*/
		HttpSession subjectsSession=request.getSession(true);
		
		subjectsSession.setAttribute("gradesList", grades);
		System.out.println("I'm calling and i will be send to AssessmentInfo page");
		response.sendRedirect("1414080902225/AssessmentInfo.jsp");
		
		
		
		

		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
	}

	
	public void init() throws ServletException {
		
	}
}
