package edu.hzu.javaweb.labs.se1414080902108;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class View1414080902108
 */
@WebServlet("/1414080902108")
public class View1414080902108 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public View1414080902108() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String subject = request.getParameter("select");
		String name = request.getParameter("name");
		HttpSession session = request.getSession();
		int grade ;
		QuestionDAO dao = new QuestionDAO();
		try {
			grade = dao.select(name, subject);
			request.setAttribute("grade",grade);
		} catch (Exception e) {
			e.printStackTrace();
		}
		session.setAttribute("subject", subject);
	    request.setAttribute("name", name);
		request.setAttribute("Message", "您查询的成绩为：");
		request.getRequestDispatcher("/result.jsp").forward(request, response);
	}

}
