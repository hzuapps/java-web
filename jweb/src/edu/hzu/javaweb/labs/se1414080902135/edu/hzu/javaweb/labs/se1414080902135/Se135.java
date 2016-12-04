package edu.hzu.javaweb.labs.se1414080902135;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.Load;
import model.User;

@WebServlet(name="Se135",urlPatterns="/1414080902135")
public class Se135 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws 
		ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws 
		ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String load=request.getParameter("load");
		String user=request.getParameter("id");
		String pass=request.getParameter("password");
		PrintWriter out= response.getWriter();
		
		
		User us=new User(user,pass);
		Load lo=new Load();
		if(load.equals("load1")){
			//µÇÂ¼
			out.println(lo.load(us,request));
		}else if(load.equals("load2")){
			//×¢²á
			out.println(lo.enroll(request,us));
		}
		out.close();
	}
}
