package edu.hzu.javaweb.labs.se12345678;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/1st")
public class Se12345678Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Se12345678Servlet() {
		super();
	}

	public void init(ServletConfig config) throws ServletException {
		
	}

	public void destroy() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 已登录
		String login = "zhang3";
		// Session
		HttpSession session = request.getSession(true);
		session.setAttribute("username", login); // 登录之后
		String username = (String) session.getAttribute("username");
		if (username == null) {
			
		}
		
		session.setMaxInactiveInterval(15);
		
		// 返回HTML
		StringBuilder html = new StringBuilder();
		html.append("<!DOCTYPE html><html><head>");
		html.append("<title>First App</title>");
		html.append("</head><body>");
		html.append("<a id=\"link\" href=\"www.hzu.edu.cn\">惠州学院</a>");
		html.append("</body></html>");
		response.setCharacterEncoding("utf-8");
		response.getWriter().append(html);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
