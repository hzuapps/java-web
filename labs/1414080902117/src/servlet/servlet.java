package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Bean.JDBC;

public class servlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public servlet() {
		super();
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

		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();

		String name = request.getParameter("name");
		String account = request.getParameter("account");
		String password = request.getParameter("password");
		String sql = String.format("insert into user(account,password,name) values ('%s','%s','%s')",account,password,name);
		JDBC jdbc  = new JDBC();
		jdbc.getUrl();
		try{
			sql = new String(sql.getBytes("ISO-8859-1"),"utf-8");
			jdbc.getConn();
			jdbc.setstmt();
			jdbc.Update(sql);
			jdbc.getUpdate();
			System.out.println("Yes");
		}
		catch(Exception e){
			out.append("{\"result\":\"连接失败\"}");
		}
		out.flush();
		out.close();
	}

	
	public void init() throws ServletException {
		// Put your code here
	}

}
