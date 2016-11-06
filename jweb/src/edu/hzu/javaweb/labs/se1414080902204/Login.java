package edu.hzu.javaweb.labs.se1414080902204;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType("text/html;charset=utf-8");
		String Name="com.mysql.jdbc.Driver";
        String userName="root";
        String userPwd="1234";
        String dbName="shenzhentong_system";
        String url="jdbc:mysql://localhost:3306/shenzhentong_system?user=root&password=1234&useUnicode=true&characterEncoding=UTF-8";
       String cardNumber =request.getParameter("kahao");
       String phoneNumber=request.getParameter("shoujihao");
       RequestDispatcher dis=null;
       try{
    	   Class.forName(Name);
           Connection conn=DriverManager.getConnection(url);
    	   String sql="select * from szt_information where( card=? and phonenumber=?)";
    	   PreparedStatement pstmt=conn.prepareStatement(sql);
    	   pstmt.setString(1, cardNumber);
    	   pstmt.setString(2, phoneNumber);
    	   ResultSet rs =pstmt.executeQuery();
    	   if (rs.next()){
    		   if(rs!=null) rs.close();
    		   if(pstmt!=null) pstmt.close();
    		   if(conn!=null) conn.close();
    		   dis=request.getRequestDispatcher("gongneng.jsp");
    		   dis.forward(request, response);
    	   }
    	   
    	   else{	  
    		   if(rs!=null) rs.close();
    		   if(pstmt!=null) pstmt.close();
    		   if(conn!=null) conn.close();
    		   dis=request.getRequestDispatcher("shibai.jsp");
    		   dis.forward(request, response);
    		   
    	   }
       }
       
       catch(Exception e){
    	   
    	   e.printStackTrace();
       }
       
       
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
	}

}
