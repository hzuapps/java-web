package edu.hzu.javaweb.labs.se1414080902221;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class management extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
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
				boolean check=true;
				if (goodsname.equals("")) {
		 		msg = "�����Ʒ���Ʋ���Ϊ��";
		 		check = false;
		 		} else if (number.equals("")) {
		 			msg = "�����������Ϊ��";
		 			check = false;
		 		} 
		 		if(check)
		 			msg="��ӳɹ���";		 	
		 		System.out.println(msg);
		 			if(check){
		 				Connection con=null; 
		 				PreparedStatement stmt=null;
		 			    ResultSet rs=null;
		 			    try{
		 			    	con=DatabaceC.getconnect();
		 					stmt=con.prepareStatement("insert into goodsinfo "+"values(?,?)");
		 					stmt.setString(1,goodsname);
		 					stmt.setString(2,number);
		 		            stmt.executeUpdate();
		 				}catch(SQLException e){
		 					System.out.println(e.getMessage());
		 				}
		 			}
		 		request.setAttribute("message", msg);
		 	request.getRequestDispatcher("/index_2.jsp").forward(request, response);
		 		session.setAttribute("message", msg);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
