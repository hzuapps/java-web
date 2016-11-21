package edu.hzu.javaweb.labs.se1414080902204;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.DbConnect;
import com.domain.Szt_information;
import com.dao.*;
public class InsertServlet extends HttpServlet {

	private static final Szt_information Szt_information = null;

	/**
	 * Constructor of the object.
	 */
	public InsertServlet() {
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

			request.setCharacterEncoding("UTF-8");
			String name=request.getParameter("name");
			String idcard=request.getParameter("idcard");
			String card=request.getParameter("card");
			String phonenumber=request.getParameter("phonenumber");
			Szt_information u1=new Szt_information();
			u1.setName(name);
			u1.setIdcard(idcard);
			u1.setCard(card);
			u1.setPhonenumber(phonenumber);
			Szt_informationDAO dao=new Szt_informationDAO();
			RequestDispatcher dis=null;
			try{
				if(dao.find(u1)==null){
					if( dao.create(u1)!=null)
					{dis=request.getRequestDispatcher("./success.jsp");
					dis.forward(request, response);
					}
				}
				else{
					dis=request.getRequestDispatcher("./erro.jsp");
					dis.forward(request, response);
				}
				
			}catch(Exception locaException){
				locaException.printStackTrace();
			}
	}

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
		
	}

}
