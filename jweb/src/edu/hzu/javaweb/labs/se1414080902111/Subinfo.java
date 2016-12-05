package edu.hzu.javaweb.labs.se1414080902111;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.hzu.javaweb.labs.se1414080902111.User;

public class SetUser extends HttpServlet {

	 
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	public SetUser() {
		super();
	}

	
	public void destroy() {
		super.destroy(); 
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");		
		response.setContentType("UTF-8");
		PrintWriter out=response.getWriter();
		String email=request.getParameter("Email");
        	String name=request.getParameter("Name");
		String id=request.getParameter("ID");
		String password=request.getParameter("PW");
		String select=request.getParameter("Select");
		String pride=request.getParameter("Money");
		String sql="Insert into Users_info(email,name,id,password,select,pride) values(?,?,?,?,?,?)";
		Util run=new Util();
        	int n=run.updateSQL(sql);
        if(n>=1) out.println("交易提交成功！"); 
	else  out.println("交易发布失败");
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request,response);
	}

	
	public void init() throws ServletException {
		
	}

}