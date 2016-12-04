package edu.hzu.javaweb.labs.se1414080902103;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/1414080902103")
public class Se1414080902103Servlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */

	/**
	 * The doGet method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		String name=request.getParameter("name");
		String id=request.getParameter("id");
		String date=request.getParameter("date");
		String note=request.getParameter("note");
		String url="jdbc:mysql://localhost:3306/kaoqin?&useUnicode=true&characterEncoding=utf8";
		

		    Connection conn=null;
		    
		    
		    
		   
		try {
			 Class.forName("com.mysql.jdbc.Driver");
			 
		
			
			
			
		}catch(ClassNotFoundException e) {


			
            e.printStackTrace();
           }
		try{
			  conn= DriverManager.getConnection(url,"sa","960418");
			  String sql = "INSERT INTO Sinfo(Sname,Sid,Sdate,Snote)values(?,?,?,?)";  
			  PreparedStatement ps = conn.prepareStatement(sql);
			  ps.setString(1,name);
			  ps.setString(2,id);
			  ps.setString(3,date);
			  ps.setString(4,note);
			  ResultSet rs=ps.executeQuery(sql);
			  if(rs.next()) {
				  if(rs!=null) 
					  rs.close();
				  if(ps!=null)
				  ps.close();
			      if(conn!=null) 
			    	  conn.close();
			        List<StuDetails> add=new ArrayList<StuDetails>();
			        add.add(new StuDetails(name,id,date,note));
					request.setAttribute("StuDetails", add);
					request.getRequestDispatcher("client.jsp").forward(request,response);
					 
			  }
			  else{
				  if(rs!=null)rs.close();
				  if(ps!=null)ps.close();
				  if(conn!=null)conn.close();
				  request.getRequestDispatcher("error.jsp").forward(request,response);
			  }
			
		} catch(SQLException e) {

			
          e.printStackTrace();


         } catch(Exception e) {

        	
          e.printStackTrace();

         
         } 
		
	}

	/**
	 * The doPost method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
	/*	String Msg = "{'姓名':'" + name + "','学号':'" + id + "','日期':'" + date
		+ "','缺勤情况':'" + note + "'}";
        JSONObject data = JSONObject.fromObject(Msg);
        out.print(data);
*/
		
		
		doGet(request,response);
		
		
		
		

         
	}

	/**
	 * Initialization of the servlet. <br>
	 * 
	 * @throws ServletException
	 *             if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}


