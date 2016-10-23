package edu.hzu.javaweb.labs.se1414080902134;

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

//import edu.hzu.javaweb.bean.se1414080902134.UserData;
import javafx.application.Application;

/**
 * Servlet implementation class Se1414080902134Servlet
 */
@WebServlet("/1414080902134")
public class Se1414080902134Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Se1414080902134Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ServletContext application=this.getServletContext(); 
		application.setAttribute("message","only dear with post method .");
		response.sendRedirect("/1414080902134/Home.jsp");
//		PrintWriter out = response.getWriter();
//		UserData ud = new UserData();
//		Enumeration<String> iter_ = (request.getParameterNames());
//		while (iter_.hasMoreElements()) {
//			String key = iter_.nextElement();
//			ud.setAttribute(key,request.getParameter(key));
//		}
//		if (ud.getQuickCode().equals("")) {
//			if (!ud.isComplete()) {
//				out.write("Information is not full .");
//			} else {
//				if (ud.getUserName().isEmpty()) {
//					out.write("Welcome , " + ud.getEmail());
//				} else {
//					out.write("Welcome , " + ud.getUserName());
//				}
//			}
//		} else {
//			out.write("QuickCode = " + ud.getQuickCode());
//		}
//		
//		out.flush();
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ServletContext application=this.getServletContext(); 
		boolean isLogin = false;
		PrintWriter out = response.getWriter();
		UserData ud = new UserData();
		Enumeration<String> iter_ = (request.getParameterNames());
		while (iter_.hasMoreElements()) {
			String key = iter_.nextElement();
			ud.setAttribute(key,request.getParameter(key));
		}
		if (ud.getQuickCode().equals("")) {
			if (!ud.isComplete()) {
				out.write("Information is not full .");
			} else {
				if (ud.getUserName().isEmpty()) {
					out.write("Welcome , " + ud.getEmail());
					isLogin = true;
				} else {
					out.write("Welcome , " + ud.getUserName());
					isLogin = true;
				}
			}
		} else {
			out.write("QuickCode = " + ud.getQuickCode());
			//isLogin = true;
		}
		if (ud.isComplete()) {
			if (isLogin) {
				application.setAttribute("UserData",ud);
				response.sendRedirect("1414080902134/HomeUser.jsp");
			} else {
				//TO DO
				//SEARCH SOMETHING FROM DATABASE BY THE QUICKCODE
			}
		} else {
			response.sendRedirect("1414080902134/Home.jsp");
		}
		out.flush();
	}

}
