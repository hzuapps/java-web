package edu.hzu.javaweb.labs.se1414080902201;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(name="LoginServlet",urlPatterns="/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("login.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("����post����...");
		// ��������
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");
        if(email.equals("")){
        	request.setAttribute("tip", "���䲻��Ϊ�գ�");                                        
            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");   
            dispatcher.forward(request, response);
            return;
        }
        if(password.equals("")){
        	request.setAttribute("tip", "���벻��Ϊ�գ�");                                        
            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");   
            dispatcher.forward(request, response);
            return;
        }
        //���� Cookie
 		Cookie cookie_email = new Cookie("email",email);
 		if(remember != null){
 			// ���ù�������Ϊ30���
 	 		cookie_email.setMaxAge(60*60*24*30);
 		}else{
 			//���ù���ʱ��Ϊ1Сʱ
 			cookie_email.setMaxAge(60*60);
 		}
 		// ����Ӧͷ�� Cookie
 		response.addCookie(cookie_email);
 		response.sendRedirect("index");


	}

}
