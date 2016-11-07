package se1414080902114;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;//使用注释时候必需导入的注释包
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import se1414080902114.Users;

@WebServlet("/1414080902114")
public class login extends HttpServlet {


	public login() {
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
		Users user=new Users();
		String type=request.getParameter("Type");
		String username=request.getParameter("Username");
		String password=request.getParameter("Password");
		user.setType(type);
		user.setUsername(username);
		user.setPassword(password);
		if(user.getType() != null&&user.getUsername()!=null&&user.getPassword()!=null){
			RequestDispatcher dispatcher=request.getRequestDispatcher("/login/main.jsp");
			dispatcher.forward(request,response);
		}

	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
