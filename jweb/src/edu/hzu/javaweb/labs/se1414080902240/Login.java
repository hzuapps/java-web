package edu.hzu.javaweb.labs.se1414080902240;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Login
 */
@WebServlet(name="Login",urlPatterns="/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Ϊ���ֺ����ϴ��� Cookie      
				Cookie name = new Cookie("name",request.getParameter("name")); // ����ת��
				
				// Ϊ���� Cookie ���ù�������Ϊ 24 Сʱ��
				name.setMaxAge(60*60*24*30); 
				
				// ����Ӧͷ��������� Cookie
				response.addCookie( name );	
				response.sendRedirect("index.jsp");
	}

}
