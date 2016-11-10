package edu.hzu.javaweb.labs.se1414080902106;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Se1414080902106Servlet extends HttpServlet {
	
	public Se1414080902106Servlet() {
		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//由于设置了编码过滤器，这里不需要额外设置request的编码方式
		
		//获取参数——标题、内容
		String title = request.getParameter("title");
		String text = request.getParameter("text");
		
		//获取已有帖子
		HttpSession session = request.getSession();
		Vector<Content> contents = (Vector<Content>)session.getAttribute("content");
		if(contents == null)
			contents = new Vector<Content>(0);
		//插入新帖子
		Content new_content = new Content();
		new_content.setTitle(title);
		new_content.setText(text);
		contents.add(new_content);
		//将新的帖子集写入session
		session.setAttribute("content", contents);		
		//将页面跳转到index.jsp
		response.sendRedirect("home.jsp");
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
