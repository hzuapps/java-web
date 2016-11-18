package se1414080902217;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.User;
import dao.UserDao;

/**
 * Servlet implementation class loginCheck
 */
@WebServlet("/1414080902217")
public class Se1414080902217Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName = request.getParameter("username");
		String userPwd = request.getParameter("userpwd");
		
		User user = new User();
		UserDao dao = new UserDao();
		try {
			user = dao.findUserByName(userName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(user == null || !user.getPassword().equals(userPwd)){
			request.setAttribute("userName", userName);
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		else{
			request.getSession().setAttribute("customerName", user.getcustomerName());
			request.getRequestDispatcher("select.jsp").forward(request, response);
		}
	}

}
