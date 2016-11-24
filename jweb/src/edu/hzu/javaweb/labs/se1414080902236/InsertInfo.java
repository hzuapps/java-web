package edu.hzu.javaweb.labs.se1414080902236;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;

public class InsertInfo extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public InsertInfo() {
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
		String Manufacturers=request.getParameter("manufacturers");
		String Level=request.getParameter("level");
		String Engine=request.getParameter("engine");
		String Gearbox=request.getParameter("gearbox");
		String Size=request.getParameter("size");
		String Body=request.getParameter("body");
		String Maxspeed=request.getParameter("maxspeed");
		String Hundred=request.getParameter("hundred");
		String Gas=request.getParameter("gas");

		 String driverName = "com.mysql.jdbc.Driver";   
		 String userName = "root";                    
		 String userPwd = "root";                  
	     String dbName = "carInfo";                 
	     String  url1="jdbc:mysql://localhost/"+dbName;
		 String  url2 ="?user="+userName+"&password="+userPwd;
		 String  url3="&useUnicode=true&characterEncoding=GB2312";
		 String  url =url1+url2+url3;
	     try {
			Connection con=DriverManager.getConnection(url);
			String FIELDS_INSERT ="manufacturers,level,engine,gearbox,size,body,maxspeed,hundred,gas";
		    String INSERT_SQL="insert into stu_info ("
		            +FIELDS_INSERT+")"+"values (?,?,?,?,?,?,?,?,?)";
		    PreparedStatement prepStmt=con.prepareStatement(INSERT_SQL);
		    prepStmt.setString(1,Manufacturers);
	    	prepStmt.setString(2,Level);
	    	prepStmt.setString(3,Engine);
	        prepStmt.setString(4,Gearbox);
	    	prepStmt.setString(5,Size);
	    	prepStmt.setString(6,Body);
	    	prepStmt.setString(7,Maxspeed);
	    	prepStmt.setString(8,Hundred);
	    	prepStmt.setString(9,Gas);	    	    	  
	        int n=prepStmt.executeUpdate(); 
	        if(n==1){
	        	request.getRequestDispatcher("/success.jsp").forward(request, response);
	        }
	        else{
	        	request.getRequestDispatcher("/error.jsp").forward(request, response);
	        }
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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

		doGet(request,response);
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
