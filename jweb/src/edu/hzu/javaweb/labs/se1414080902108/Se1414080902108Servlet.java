package edu.hzu.javaweb.labs.se1414080902108;

import java.io.IOException;
import java.io.PrintWriter;
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
		request.setCharacterEncoding("utf-8");
		QuestionDAO dao = new QuestionDAO();
		List<Question> questionlist = new ArrayList<Question>();
		try {
			questionlist = dao.findAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("Message", "查看所有题目");
		request.setAttribute("result", questionlist);
		request.getRequestDispatcher("/show.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		String subject = request.getParameter("subject");
		String question = request.getParameter("question");
		String answer1 = request.getParameter("answer1");
		String answer2 = request.getParameter("answer2");
		String answer3 = request.getParameter("answer3");
		String answer4 = request.getParameter("answer4");
		String answer = request.getParameter("answer");

		Question que = new Question(subject, question, answer1, answer2,
				answer3, answer4, answer, 0);

		QuestionDAO dao = new QuestionDAO();
		try {
			int n = dao.create(que);
			if (n >= 1) {
				request.setAttribute("Message", "保存成功");
			} else {
				request.setAttribute("Message", "保存失败");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		List<Question> questionlist = new ArrayList<Question>();
		try {
			questionlist = dao.findAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("result", questionlist);
		request.getRequestDispatcher("/show.jsp").forward(request, response);
	}

}
