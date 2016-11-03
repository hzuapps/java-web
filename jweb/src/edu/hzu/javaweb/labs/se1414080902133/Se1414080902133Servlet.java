package edu.hzu.javaweb.labs.se1414080902133;
import java.io.IOException;
import java.io.PrintWriter;

import javax.jws.WebService;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/1414080902133")
public class Se1414080902133Servlet extends HttpServlet {
	public Se1414080902133Servlet() {
		super();
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); 
		response.setContentType("text/html;charset=UTF-8");
		String userName=request.getParameter("username");
		String userPwd=request.getParameter("userpwd");
		String info="";
		if(("adc".equals(userName))&&"123".equals(userPwd)){
			info="欢迎你"+userName+"!";
		}
		else
		{
			info="用户名或密码不正确!";
		}
		request.setAttribute("outputMessage", info);
		request.getRequestDispatcher("info.jsp").forward(request,response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//request.setCharacterEncoding("utf-8"); 
		response.setContentType("text/html;");
		String userName=request.getParameter("username");
		String userPwd=request.getParameter("userpwd");
		String info="";
		if(("wzw773828204".equals(userName))&&("ljc0704".equals(userPwd))){
			info="欢迎你"+userName+"!";
		}
		else
		{
			info="用户名或密码不正确!";
		}
		request.setAttribute("outputMessage", info);
		request.getRequestDispatcher("info.jsp").forward(request,response);
	}
}
