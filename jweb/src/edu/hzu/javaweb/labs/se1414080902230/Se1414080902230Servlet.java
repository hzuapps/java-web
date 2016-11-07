package edu.hzu.javaweb.labs.se1414080902230;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/1414080902230")

public class Se1414080902230Servlet extends HttpServlet{

	private UserData ud;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("text/html;charset=utf-8"); 
		PrintWriter print = resp.getWriter(); 
		boolean islogin=false;
		ud=new UserData();
		ServletContext application=getServletContext();

		for(Enumeration<String> iterator=req.getParameterNames();iterator.hasMoreElements();){
			String key=iterator.nextElement();
			ud.setAttribute(key, req.getParameter(key));
		}
		if(!ud.EmptyInput()){
			print.write("welcome "+ud.getUsername()+" !");
			islogin=true;
		}else{
			print.write("please complete the information");

		}
		if(islogin==true){
			application.setAttribute("userdata", ud);
			resp.sendRedirect("1414080902230/home.jsp");
		}else{
			resp.sendRedirect("1414080902230/index.jsp");
		}
	}

}
