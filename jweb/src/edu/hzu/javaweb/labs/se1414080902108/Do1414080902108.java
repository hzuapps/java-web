package edu.hzu.javaweb.labs.se1414080902108;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Do1414080902108
 */
@WebServlet("/1414080902108")
public class Do1414080902108 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Do1414080902108() {
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
		HttpSession session = request.getSession();
		String subject = (String) session.getAttribute("subject");
		String name = (String) session.getAttribute("name");
		int grade = 0;
		Question que = new Question();
		que.setSubject(subject);
		QuestionDAO dao = new QuestionDAO();
		List<Question> questionlist = new ArrayList<Question>();
		try {
			questionlist = dao.findExam(que);
		} catch (Exception e) {
			e.printStackTrace();
		}
		for (int i = 1; i <= questionlist.size(); i++) {
			String answer = "answer" + i ;
			answer = request.getParameter(answer);
			if (answer.equals(questionlist.get(i-1).getAnswer())) {
				grade += 10;
			}
		}
		try {
			int a = dao.createGrade(subject, name, grade);
			request.setAttribute("name", name);
			if(a>=1){
				request.setAttribute("Message", "提交成功，您的成绩为：");
			}else{
				grade = dao.select(name, subject);
				request.setAttribute("Message", "提交失败，您已经参加过考试！");
			}
			request.setAttribute("grade", grade);
			request.getRequestDispatcher("/result.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String subject = request.getParameter("select");
		session.setAttribute("subject", subject);
		Question que = new Question();
		que.setSubject(subject);
		QuestionDAO dao = new QuestionDAO();
		List<Question> questionlist = new ArrayList<Question>();
		try {
			questionlist = dao.findExam(que);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("Message", subject);
		request.setAttribute("result", questionlist);
		request.getRequestDispatcher("/exam.jsp").forward(request, response);
	}

}
