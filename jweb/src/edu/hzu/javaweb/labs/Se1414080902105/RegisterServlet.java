package se1414080902105;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName = request.getParameter("username");
		String userPwd = request.getParameter("userpwd");
		String cName = request.getParameter("cname");
		String userAddr = request.getParameter("useraddr");
	
		User user = new User();
		user.setcustomerName(cName);
		user.setUsername(userName);
		user.setPassword(userPwd);
		user.setUseraddr(userAddr);
		request.setAttribute("user", user);
		UserDao dao = new UserDao();
		try{
			dao.add(user);
			request.getSession().setAttribute("userName", user.getUsername());
			request.getSession().setAttribute("customerName", user.getcustomerName());
			request.removeAttribute("user");
			request.getRequestDispatcher("success.jsp").forward(request, response);
		}catch(Exception e){
			throw new ExceptionInInitializerError(e);
		}finally{request.getRequestDispatcher("error.jsp").forward(request, response);}
	}

}