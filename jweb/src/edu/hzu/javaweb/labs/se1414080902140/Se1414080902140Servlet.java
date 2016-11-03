package edu.hzu.javaweb.labs.se1414080902140;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/1414080902140")
public class Se1414080902140Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Se1414080902140Servlet() {
		super();
	}

	public void init(ServletConfig config) throws ServletException {
		
	}

	public void destroy() {
	}

//	protected void doGet(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		
		// 已登录
//		String login = "zhang3";
//		// Session
//		HttpSession session = request.getSession(true);
//		session.setAttribute("username", login); // 登录之后
//		String username = (String) session.getAttribute("username");
//		if (username == null) {
//			
//		}
//		
//		session.setMaxInactiveInterval(15);
//		
//		// 返回HTML
//		StringBuilder html = new StringBuilder();
//		html.append("<!DOCTYPE html><html><head>");
//		html.append("<title>First App</title>");
//		html.append("</head><body>");
//		html.append("<a id=\"link\" href=\"www.hzu.edu.cn\">惠州学院</a>");
//		html.append("</body></html>");
//		response.setCharacterEncoding("utf-8");
//		response.getWriter().append(html);
//	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id=request.getParameter("id");
		String name=request.getParameter("name");
		String sex=request.getParameter("sex");
		String age=request.getParameter("age");
		String hight=request.getParameter("hight");
		String weight=request.getParameter("weight");
		String pulmonary =request.getParameter("pulmonary");
		String longRun=request.getParameter("longRun");
		String shortRun=request.getParameter("shortRun");
		String show ="";
		if(id.equals("")||name.equals("")||sex.equals("")||age.equals("")||hight.equals("")
		||weight.equals("")||pulmonary.equals("")||longRun.equals("")||shortRun.equals("")){
			show="不允许有空项，若该生无某项成绩，可将成绩设置为0";
		}
		
		request.setAttribute("outputMessage", show);
		request.getRequestDispatcher("/show.jsp").forward(request, response);//实现由servlet到JSP的跳转。
		//response.setContentType("text/html");
		

	}

}
