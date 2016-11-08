package edu.hzu.javaweb.labs.se1414080902108;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class loginSe1414080902108
 */
@WebServlet("/1414080902108")
public class LoginSe1414080902108 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginSe1414080902108() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("userName");
		String password = request.getParameter("password");
		String returnUri = request.getParameter("return_uri");
		RequestDispatcher rd = null;
		if(username == "" || password == ""){
			request.setAttribute("msg", "用户名或者密码为空！！！");
			rd = request.getRequestDispatcher("/sign_up.jsp");
			rd.forward(request, response);
		}else{
			request.getSession().setAttribute("name", username);
			request.getSession().setAttribute("flag", "login_success");
			if(returnUri != null){
				rd = request.getRequestDispatcher(returnUri);
				rd.forward(request, response);
			}else{
				rd = request.getRequestDispatcher("/index.jsp");
				rd.forward(request, response);
			}
		}
	}

}
