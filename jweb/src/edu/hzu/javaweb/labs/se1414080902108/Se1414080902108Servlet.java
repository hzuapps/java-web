package edu.hzu.javaweb.labs.se1414080902108;

import java.awt.List;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Se1414080902108Servlet
 */
@WebServlet("/1414080902108")
public class Se1414080902108Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ArrayList<Question> questionlist = new ArrayList<Question>();
	int i=0;
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Se1414080902108Servlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
        i++;
		String subject = request.getParameter("subject");
		String question = request.getParameter("question");
		String answer1 = request.getParameter("answer1");
		String answer2 = request.getParameter("answer2");
		String answer3 = request.getParameter("answer3");
		String answer4 = request.getParameter("answer4");
		String answer = request.getParameter("answer");
		String info = "保存成功";
		questionlist.add(new Question(subject, question, answer1, answer2,
				answer3, answer4, answer,i));
		request.setAttribute("result", questionlist);
		request.setAttribute("Message", info);
		request.getRequestDispatcher("/show.jsp").forward(request, response);
	}

}
