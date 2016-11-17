package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Bean.JDBC;
import Bean.checkBean;

public class check extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public check() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

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
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		String account = request.getParameter("account");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		
		checkBean check = new checkBean();
		if(account != null)
		{
			account = new String(account.getBytes("ISO-8859-1"),"utf-8");

			check.setCheck_acc(account);
			check.Check();
			if(check.getExit() == true)
			{
				out.append("{\"account\":\"<b style='color:#FF0000'>账号已经被其他人使用</b>\"}");
			}
			else
			{
				//out.append("{\"account\":\"账号未被使用，可以注册\"}");
				out.append("{\"account\":\"\"}");
			}
		}
		if(name != null)
		{
			name =  new String(name.getBytes("ISO-8859-1"),"utf-8");
			check.setCheck_name(name);
			check.Check();
			if(check.getExit() == true)
			{
				out.append("{\"name\":\"<b style='color:#FF0000'>该昵称已经被其他人使用</b>\"}");
			}
			else
			{
				//out.append("{\"name\":\"该昵称未被使用，可以进行注册\"}");
				out.append("{\"name\":\"\"}");
			}
		}
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
	}

}
