package edu.hzu.javaweb.labs.se1414080902206;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  request.setCharacterEncoding("utf-8");
		  HttpSession session = request.getSession();
		  Login_Passenger passenger = new Login_Passenger();
		  if(request.getParameter("Username")!= null)
		  passenger.setUsername(request.getParameter("Username"));
		  if(request.getParameter("Email")!= null)
		  passenger.setEmail(request.getParameter("Email"));
		  if(request.getParameter("Password")!= null)
		  passenger.setPassword(request.getParameter("Password"));
		  session.setAttribute("Passenger", passenger);
		  if(session.getAttribute("Passenger") != null)
		  request.getRequestDispatcher("/index.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}