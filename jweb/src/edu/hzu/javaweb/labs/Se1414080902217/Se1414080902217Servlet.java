package Se1414080902217;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class loginCheck
 */
@WebServlet("/1414080902217")
public class Se1414080902217Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName = request.getParameter("username");
		String userPwd = request.getParameter("userpwd");
		if(userName.equals("") || userPwd.equals(""))
		{
			request.getRequestDispatcher("check.jsp").forward(request, response);
		}
		else
		{
			request.getSession().setAttribute("userName", userName);
			request.getRequestDispatcher("select.jsp").forward(request, response);
		}
	}

}
