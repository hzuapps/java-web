package edu.hzu.javaweb.labs.se1414080902125;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class se1414080902125
 */
@WebServlet("/1414080902125")
public class Se1414080902125 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Se1414080902125() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("UTF-8");
		String name=request.getParameter("NAME");
		String pw=request.getParameter("PW");
		String user=request.getParameter("USER");
		String school=request.getParameter("SCHOOL");
		String majo=request.getParameter("MAJO");
		
		String info= "用户名："+name+"；密码："+pw+"；身份："+user+"；学校："+school+"；专业："+majo;
		
		request.setAttribute("outputMessage", info);
		request.getRequestDispatcher("/info.jsp").forward(request,response);
	}

}
