package edu.hzu.javaweb.labs.se1414080902138;
import java.sql.*;



import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.hzu.javaweb.labs.se1414080902138.*;

@WebServlet("/InsertServlet")
public class InsertServlet extends HttpServlet {
	private static final Staff_information User_information = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String id=request.getParameter("id");
		String name=request.getParameter("name");
		int age=Integer.parseInt(request.getParameter("age"));
		String sex=request.getParameter("sex");
		String tel=request.getParameter("tel");
		String address=request.getParameter("address");
		String payment=request.getParameter("payment");
		Staff_information u1=new Staff_information();
		u1.setId(id);
		u1.setName(name);
		u1.setAge(age);
		u1.setSex(sex);
		u1.setTel(tel);
		u1.setAddress(address);
		u1.setPayment(payment);
		Staff_informationDAO dao=new Staff_informationDAO();
		RequestDispatcher dis=null;
		try{
			if(dao.find(u1)==null){
				if( dao.create(u1)!=null)
				{
					dis=request.getRequestDispatcher("./ShowAllStaffServlet");
				dis.forward(request, response);
				}
			}
			else{request.setAttribute("state", "添加失败,教职工已存在!");
				dis=request.getRequestDispatcher("./addstaff.jsp");
				dis.forward(request, response);
			}
			
		}catch(Exception locaException){
			locaException.printStackTrace();
		}
	}

}
