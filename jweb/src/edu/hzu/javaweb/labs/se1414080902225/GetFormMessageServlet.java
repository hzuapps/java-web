package edu.hzu.javaweb.labs.se1414080902225;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import MainController.SqlHelper;



//@WebServlet(value="/GetFormMessageServlet")
public class GetFormMessageServlet extends HttpServlet {


	public GetFormMessageServlet() {
		super();
	}

	
	public void destroy() {
		super.destroy(); 
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			String user=request.getParameter("user");
			String pwd=request.getParameter("pwd");
			String role=request.getParameter("login");
			String sqltext="select account,password from userinfo where account=? and password=? and role=?";
			String parameter[]=new String [3];
			parameter[0]=user;
			parameter[1]=pwd;
			parameter[2]=role;
			ResultSet loginMessage= new SqlHelper().executeQueryRS(sqltext, parameter);
			String dbuser = null,dbpwd = null;
			try
			{
				while (loginMessage.next())
				{
					dbuser=loginMessage.getString(1);
					dbpwd=loginMessage.getString(2);
					
				}
				
			} catch (SQLException e) {
				System.out.print(e.getMessage());
			}
			boolean islegal=(user.equals(dbuser)&&dbpwd.equals(pwd));
			if (islegal)
			{
				HttpSession loginSession=request.getSession(true);
				loginSession.setAttribute("user",user);
				loginSession.setAttribute("pwd", pwd);
				loginSession.setAttribute("role", role);
				response.sendRedirect("InitSubjectInfo");
			}
			else
			{
				response.sendRedirect("1414080902225/index.jsp");
			}
 			
		
	}

	
	public void init() throws ServletException {
	}
}
