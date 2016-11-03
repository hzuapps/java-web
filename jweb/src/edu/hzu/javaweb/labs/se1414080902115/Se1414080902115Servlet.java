package edu.hzu.javaweb.labs.se1414080902115;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Se1414080902115Servlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public Se1414080902115Servlet() {
		super();
		System.out.println("dasdsa");
		
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		String user=request.getParameter("username");
		String pwd=request.getParameter("userpwd");
		String b=request.getParameter("check");
		boolean check=false;
		System.out.println(b);
		if("1".equals("check")) check=true;
		else check=false;
		
		UserData data=new UserData();
		   data.setUser(user);
		   data.setPwd(pwd);
		  data.setRemeber(check);
		  data.setRemeber(check);
		PrintWriter out = response.getWriter();
		String username=request.getParameter("username");
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A New Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print(" "+data.getUser()+" ,"+"惠州学院图书馆欢迎你！"+"<br>");
		out.print(this.getClass());
	
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {  
	
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("   欢迎你  !");
		out.print(this.getClass());
		out.println(", using the POST method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
		//��ʼ��
		System.out.println("init(_)");
	}

}
