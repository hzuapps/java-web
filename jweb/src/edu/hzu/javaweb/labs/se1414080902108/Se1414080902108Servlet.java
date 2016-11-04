package edu.hzu.javaweb.labs.se1414080902108;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Se1414080902108Servlet
 */
@WebServlet("/1414080902108")
public class Se1414080902108Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Se1414080902108Servlet() {
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
		// TODO Auto-generated method stub
		String subject = request.getParameter("subject");
		String question = request.getParameter("question");
		String answer1 = request.getParameter("answer1");
		String answer2 = request.getParameter("answer2");
		String answer3 = request.getParameter("answer3");
		String answer4 = request.getParameter("answer4");
		String answer = request.getParameter("answer");
		String info = "保存成功";
		
		
		request.setAttribute("Message", info);
		request.setAttribute("subject", subject);
		request.setAttribute("question", question);
		request.setAttribute("answer1", answer1);
		request.setAttribute("answer2", answer2);
		request.setAttribute("answer3", answer3);
		request.setAttribute("answer4", answer4);
		request.setAttribute("answer", answer);
		request.getRequestDispatcher("/show.jsp").forward(request, response);
	}

}
