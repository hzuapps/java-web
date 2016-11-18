package edu.hzu.javaweb.labs.se1414080902221;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/1414080902221")
public class Servlet1414080902221 extends HttpServlet {

	public Servlet1414080902221() {
		super();
		// TODO Auto-generated constructor stub
	}

	private static final long serialVersionUID = 1L;

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
	}


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String goodsname="";
		String number="";
		if(request.getParameter("goodsname")!=null){
			 goodsname =(String)request.getParameter("goodsname");
		}
			
		if(request.getParameter("number")!=null)
			number = (String)request.getParameter("number");
		HttpSession session=request.getSession(true);
		String msg = "";
		if (goodsname.equals("")) {
			msg = "添加商品名称不能为空";
		} else if (number.equals("")) {
			msg = "添加数量不能为空";
		} 
		else{
			msg="添加成功！";
		}
		System.out.println(msg);
		request.setAttribute("message", msg);
		request.getRequestDispatcher("/index_2.jsp").forward(request, response);
		session.setAttribute("message", msg);

	}
	public void init() throws ServletException {
		// Put your code here
	}

}