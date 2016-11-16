package edu.hzu.javaweb.labs.se1414080902106;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Login extends HttpServlet {
	
	public Login() {
		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//获取参数——用户名、密码
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		//判断是否正确
		if("test".equals(username) && "me".equals(password)){		
			//将用户名放到session里
			HttpSession session = request.getSession();
			session.setAttribute("username", username);
			//将页面跳转到home.jsp
			response.sendRedirect("home.jsp");
		}else
			//错误就返回登录页面
			response.sendRedirect("./");
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
