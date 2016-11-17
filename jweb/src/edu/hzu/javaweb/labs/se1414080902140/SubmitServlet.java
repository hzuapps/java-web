package edu.hzu.javaweb.labs.se1414080902140;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SubmitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public  SubmitServlet() {
		// TODO Auto-generated constructor stub
	
		super();
	}
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String name=request.getParameter("name");
		String sno=request.getParameter("sno");
		String sex=request.getParameter("sex");
		String age=request.getParameter("age");
		String hight=request.getParameter("hight");
		String weight=request.getParameter("weight");
		String pulmonary=request.getParameter("pulmonary");
		String longRun=request.getParameter("longRun");
		String shortRun=request.getParameter("shortRun");
	    //Student student=new Student("name");
 	    List<Student> stuList=new ArrayList<Student>();
		stuList.add(new Student(name,sex,sno,age,hight,weight,pulmonary,longRun,shortRun));
		request.setAttribute("result", stuList);



		request.getRequestDispatcher("/doSubmit.jsp").forward(request, response);
		
	}
}
