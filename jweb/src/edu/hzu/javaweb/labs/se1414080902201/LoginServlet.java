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
		System.out.println("处理post请求...");
		// 接收数据
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");
        if(email.equals("")){
        	request.setAttribute("tip", "邮箱不能为空！");                                        
            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");   
            dispatcher.forward(request, response);
            return;
        }
        if(password.equals("")){
        	request.setAttribute("tip", "密码不能为空！");                                        
            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");   
            dispatcher.forward(request, response);
            return;
        }
        //创建 Cookie
 		Cookie cookie_email = new Cookie("email",email);
 		if(remember != null){
 			// 设置过期日期为30天后
 	 		cookie_email.setMaxAge(60*60*24*30);
 		}else{
 			//设置过期时间为1小时
 			cookie_email.setMaxAge(60*60);
 		}
 		// 在响应头中 Cookie
 		response.addCookie(cookie_email);
 		response.sendRedirect("index");


	}

}
