package edu.hzu.javaweb.labs;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hzu.util.JDBC;

public class SC1414080902116Serevlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public SC1414080902116Serevlet() {
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

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the GET method");
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

		JDBC jdbc = new JDBC();
		response.setContentType("text/html");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		String name = request.getParameter("name1");
		String delete = String.format("delete from yonghu where name='%s'", name);
		String sql = "select * from yonghu";
		try
		{
			jdbc.getConnection();
			jdbc.setUpdate(delete);
			ResultSet Rs = jdbc.setQuery(sql);
			out.println("���ӳɹ�<br>");
			out.println("<table border='1'><tr>");
		    out.println("<td>name</td>");
		    out.println("<td>id</td>");
		    out.println("<td>roomnumber</td>");
		    out.println("<td>telephone</td>");
		    out.println("<td>assumption</td>");
		    out.println("</tr>");
			while(Rs.next())
			{  
			    String name1 = Rs.getString("name");
				String id1 = Rs.getString("id");
				String roomnumber1 = Rs.getString("roomnuber");
				String telephone1 = Rs.getString("telephone");
				String assumption1 = Rs.getString("assumption");
				out.println("<tr>");
		       	out.println("<td>"+name1+"</td>");
		       	out.println("<td>"+id1+"</td>");
		       	out.println("<td>"+roomnumber1+"</td>");
		       	out.println("<td>"+telephone1+"</td>");
		       	out.println("<td>"+assumption1+"</td>");
				out.println("</tr>");
			}
				out.println("</table><br>");
				out.println("<a href='/sy5/add1.jsp'>����</a>");
		}
		catch (Exception e){
			
			
		}
		out.flush();
		out.close();
	}

	/**
	 * The doPut method of the servlet. <br>
	 *
	 * This method is called when a HTTP put request is received.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPut(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Put your code here
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
