package se1414080902114;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;//使用注释时候必需导入的注释包
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	
    public void calendar(HttpSession session){
        Calendar rightNow=Calendar.getInstance();
        Integer Hour=new Integer(rightNow.get(Calendar.HOUR_OF_DAY));;
        session.setAttribute("hour",Hour);
    }

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
	    HttpSession session = request.getSession();
		Users user=new Users();
		String type=request.getParameter("Type");
		String username=request.getParameter("Username");
		String password=request.getParameter("Password");
		user.setType(type);
		user.setUsername(username);
		user.setPassword(password);
		session.setAttribute("username",username);//把用户登录账号保存到session中
		session.setAttribute("password",password);//把用户登录密码保存到session中
		session.setAttribute("type",type);//把用户类型的保存到session中
		calendar(session);
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
