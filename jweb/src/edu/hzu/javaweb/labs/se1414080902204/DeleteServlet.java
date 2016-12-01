package edu.hzu.javaweb.labs.se1414080902204;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.Szt_informationDAO;
import com.domain.Szt_information;

public class DeleteServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public DeleteServlet() {
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

		request.setCharacterEncoding("UTF-8");
		String name=request.getParameter("name");
		String idcard=request.getParameter("idcard");
		String card=request.getParameter("card");
		String phonenumber=request.getParameter("phonenumber");
		Szt_information u2=new Szt_information();
		u2.setName(name);
		u2.setIdcard(idcard);
		u2.setCard(card);
		u2.setPhonenumber(phonenumber);
		Szt_informationDAO dao=new Szt_informationDAO();
		RequestDispatcher dis=null;
		try{
			if(dao.find(u2)!=null){
				dao.remove(u2);
				dis=request.getRequestDispatcher("./success.jsp");
				dis.forward(request, response);
				
			}
			else{
				dis=request.getRequestDispatcher("./erro.jsp");
				dis.forward(request, response);
			}
			
		}catch(Exception locaException){
			locaException.printStackTrace();
		}
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

		doGet(request, response);
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
