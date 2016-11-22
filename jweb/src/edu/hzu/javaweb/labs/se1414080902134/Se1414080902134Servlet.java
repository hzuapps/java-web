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
import javax.servlet.http.HttpSession;

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
		//ServletContext application=this.getServletContext(); 
		//application.setAttribute("message","only dear with post method .");
		System.out.println("only dear with post method");
		response.sendRedirect("/jweb/1414080902134/Home.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		session.setAttribute("info", null);
		session.setAttribute("label", null);
		session.setAttribute("quickCode", null);
		Object isLogin_ = session.getAttribute("isLogin");
		boolean isLogin = false;
		ServletContext application=this.getServletContext();
		UserData ud = new UserData();
		Object ud_ = session.getAttribute("ud");
		Enumeration<String> iter_ = (request.getParameterNames());
		////////////if is login and remembered ///////////////////
		if (isLogin_ != null && ud_ != null) {
			if (((String)isLogin_).equals("true")) {
				isLogin = true;
			} else {
				session.setAttribute("isLogin", null);
			}
		}
		///////////////// fill the form //////////////////////////
		while (iter_.hasMoreElements()) {
			String key = iter_.nextElement();
			ud.setAttribute(key,request.getParameter(key));
		}
		//////////////// try to login ///////////////////
		ud.isComplete();
		///////////////// quickcode first /////////////////
		if (!ud.getQuickCode().equals("")) {
			//to get a note
			note n = new note();
			notesDao nd = new notesDao();
			n.setQuickCode(ud.getQuickCode());
			nd.fillNote(n);
			System.out.println("quickCode is " + n.getQuickCode());
			if (n.isFill) {
				session.setAttribute("label",n);
				System.out.println("quickCode success");
			} else {
				session.setAttribute("info","Please a right quick code .");
				System.out.println("quickCode fail");
			}
			response.sendRedirect("1414080902134/home.jsp");
		}
		else if (ud.isLogin) {
			//new user login , keep down the new one
			session.setAttribute("ud", ud);
			System.out.println("login");
			session.setAttribute("login",true);
			response.sendRedirect("1414080902134/ShowLabels.jsp");
		} else if (isLogin) {
			//if there is a user is login
			System.out.println("old login");
			session.setAttribute("login",true);
			session.setAttribute("ud", ud);
			response.sendRedirect("1414080902134/ShowLabels.jsp");
		} else {
			//login fail
			session.setAttribute("info","Try to login to continue .[user name or password is wrong]");
			System.out.println("login fail");
			response.sendRedirect("1414080902134/home.jsp");
		}
	}

}
