package edu.hzu.javaweb.labs.se1414080902203;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import edu.hzu.javaweb.labs.se1414080902203.DBUtil;

public class Register extends HttpServlet {

	public Register() {
		super();
	}

	public void destroy() {
		super.destroy(); 
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			
		request.setCharacterEncoding("UTF-8");
		int year=Integer.parseInt(request.getParameter("year"));
		int month=Integer.parseInt(request.getParameter("month"));
		int day=Integer.parseInt(request.getParameter("day"));
		
		String sql1="Insert into sign(Year,Month,Day)";
		String sql2="values("+year+","+month+","+day+");";
		String sql=sql1+sql2;
		
		DBUtil run=new DBUtil();
		int n=run.updateSql(sql);
		System.out.print(n);
		if(n<1)
			request.getRequestDispatcher("Error.jsp").forward(request,response);
		else
			request.getRequestDispatcher("Success.jsp").forward(request,response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			
		doGet(request,response);
	}
	public void init() throws ServletException {
		
	}

}
