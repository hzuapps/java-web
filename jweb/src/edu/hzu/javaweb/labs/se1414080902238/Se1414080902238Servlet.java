package edu.hzu.javaweb.labs.se1414080902238;

import java.io.IOException;
//import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/1414080902238")
public class Se1414080902238Servlet extends HttpServlet {

	

	private static final long serialVersionUID = 1L;

	
	public Se1414080902238Servlet() {
		super();
	}

	
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String khName=request.getParameter("stuName");
		String phoneNamber=request.getParameter("phoneName");
		String info="";
		if(khName.isEmpty()||phoneNamber.isEmpty()){
			info="输入不能为空！";
		}else{
			info="客户： "+khName+"  "+"联系电话： "+phoneNamber;
		}
		request.setAttribute("outputMessage",info);
		request.getRequestDispatcher("/info.jsp").forward(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

	
	public void init() throws ServletException {
		// Put your code here
	}

}
