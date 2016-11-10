package edu.hzu.javaweb.labs.se1414080902208;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class se1414080902208
 */
@WebServlet("/1414080902208")
public class Se1414080902208 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Se1414080902208() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doPost(request, response);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("UTF-8");
		String name=request.getParameter("NAME");
		String password=request.getParameter("PASSWORD");
		String article=request.getParameter("ARTICLE");
		
		
		String info= "用户名："+name+"；密码："+password+"；文章："+article;
		
		request.setAttribute("outputMessage", info);
		request.getRequestDispatcher("/info.jsp").forward(request,response);
	}

}
