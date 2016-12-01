package edu.hzu.javaweb.labs.se1414080902131;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Enumeration;
import java.util.Iterator;
import javafx.application.Application;
public class Se1414080902131Servlet extends HttpServlet {
	public Se1414080902131Servlet(){
		super();
	}
	public void destory(){
		super destory();
	}
	protected void doGet(HttpServletRequest request,HttpServletResponse response)
	        throws ServletException,IOException{
		response.setCharacterEncoding("utf-8");
		ServletContext application=this.getServletContext();
		application.setAttribute("message","借款成功！");
		response.sendRedirect("/1414080902131/Right.jsp");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	ServletContext application=this.getServletContext();
	UserData ud=new UserData();
	response.setContentType("text/html");
	PrintWrite out=response.getWriter();
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	Enumeration<String>iter_=(request.getParameterNames());
	while(iter_hasMoreElements()){
		String key=iter_nextElement();
		ud.setAttribute(key,request.getAttribute(key));
	}
		if(!ud.isComplete()){
			out.write("此处信息不能为空！")
		}else {application.setAttribute("UserData",ud);
		response.sendRedirect("/1414080902131/Right.jsp");}
	}
	}
	public void init()throws
	ServletException{
		System.out.println("init(_)");
		out.fulsh();
	}
}
