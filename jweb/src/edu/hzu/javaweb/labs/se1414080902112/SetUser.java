package edu.hzu.javaweb.labs.se1414080902112;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.hzu.javaweb.labs.se1414080902112.User;

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
		String name=request.getParameter("name");
        String sex=request.getParameter("sex");
		String id=request.getParameter("id");
		String brithdate=request.getParameter("brithdate");
		String information=request.getParameter("information");
		String sql="Insert into Users_info(name,sex,id,brithdate,information) values(?,?,?,?,?)";
		Util run=new Util();
        int n=run.updateSQL(sql);
        if(n>=1) out.println("户籍添加成功！"); else  out.println("户籍添加失败");
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request,response);
	}

	
	public void init() throws ServletException {
		
	}

}