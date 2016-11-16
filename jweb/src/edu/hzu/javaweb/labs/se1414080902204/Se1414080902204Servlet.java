package edu.hzu.javaweb.labs.se1414080902204;

import java.awt.Window;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.spi.DirStateFactory.Result;
import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Se1414080902204Servlet
 */
@WebServlet("/Se1414080902204Servlet")
public class Se1414080902204Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Se1414080902204Servlet() {
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

      
       String xingming= request.getParameter("Username");
       String idCard =request.getParameter("IdCard");
       String cardNumber =request.getParameter("CardNumber");
       String phoneNumber=request.getParameter("Pnumber");
       
       RequestDispatcher dis=null;
       try{
    	   Class.forName(Name);
           Connection conn=DriverManager.getConnection(url);
    	   String sql="select * from szt_information where(name=? or idcard=? or card=? or phonenumber=?)";
    	   PreparedStatement pstmt=conn.prepareStatement(sql);
    	   pstmt.setString(1,xingming);
    	   pstmt.setString(2, idCard);
    	   pstmt.setString(3, cardNumber);
    	   pstmt.setString(4, phoneNumber);
    	   ResultSet rs =pstmt.executeQuery();
    	   if (rs.next()){
    		   if(rs!=null) rs.close();
    		   if(conn!=null) conn.close();
    		   dis=request.getRequestDispatcher("bangdingerro.jsp");
    		   dis.forward(request, response);
    	   }
    	   
    	   else{
    		   String sql1="Insert into szt_information (name,idcard,card,phonenumber) values(?,?,?,?)";
    		   PreparedStatement pstmt1=conn.prepareStatement(sql1);
    		   request.setCharacterEncoding("UTF-8");
    		   pstmt1.setString(1, xingming);
    		   pstmt1.setString(2, idCard);
    		   pstmt1.setString(3, cardNumber);
    		   pstmt1.setString(4, phoneNumber);
    		   int n=pstmt1.executeUpdate();
    		   {  if(n==1){ System.out.println("数据插入数据库成功！");}
    		   else {System.out.println("数据插入数据库失败！");}
    		   }
/*    		   if(rs!=null) rs.close();
*/    		   if(pstmt!=null) pstmt.close();
    		   if(conn!=null) conn.close();
    		   dis=request.getRequestDispatcher("bangdingsuccess.jsp");
    		   dis.forward(request, response);
    		   
    	   }
       }
       
       catch(Exception e){
    	   
    	   e.printStackTrace();
       }
       
       
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
