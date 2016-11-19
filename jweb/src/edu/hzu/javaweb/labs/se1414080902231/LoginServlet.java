package edu.hzu.javaweb.labs.se1414080902231;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println(1111);
		response.setContentType("text");
		PrintWriter out=response.getWriter();
		
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		
		User user=null;
		
		System.out.println("输入的username："+username);
		System.out.println("输入的password："+password);
		if(username==""||password=="")
		{
			System.out.println(1111);
			out.print(0);
		}
		//查询是否有此用户
		else// if(username.equals("admin")&&password.equals("admin"))
		{
			user=new UserDao().findUser(username, password);
			if(user==null)
			{
				System.out.println("null");
				out.print(0);
				return;
			}
			else//success
			{
				HttpSession session=request.getSession();
				session.setAttribute("username",username );
	//			session.setAttribute("password",password );
				System.out.println(user.getPassword());
				System.out.println(user.getUsername());
				out.print(1);
				return;
			}
		}
		
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}















