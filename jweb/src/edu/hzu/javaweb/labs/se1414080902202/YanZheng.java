 package edu.hzu.javaweb.labs.se1414080902202;

import java.io.IOException;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class YanZheng extends HttpServlet {

	public void doGet(HttpServletRequest request,HttpServletResponse response)
	           throws ServletException,IOException{
		String driverName="com.mysql.jdbc.Driver";
		String userName="root";
		String userPwd="wyz1994";
		String dbName="user";
		String url1="jdbc:mysql://localhost:3306/"+dbName;
		String url2="?user="+userName+"&password="+userPwd;
		String url3="&useUnicode=true&characterEncoding=utf-8";
		String url=url1+url2+url3;
		request.setCharacterEncoding("utf-8");
		String name=request.getParameter("textfield3");
		String pw=request.getParameter("textfield4");
		RequestDispatcher dis=null;
		try {
			  Class.forName(driverName);
			  Connection conn=DriverManager.getConnection(url);
			  String sql="select* from user-b where(uname=? and upassword=?)";
			  PreparedStatement pstmt=conn.prepareStatement(sql);
			  pstmt.setString(1,name);
			  pstmt.setString(2,pw);
			  ResultSet rs=pstmt.executeQuery();
			  if(rs.next()) {
				  if(rs!=null) rs.close();
				  if(pstmt!=null) pstmt.close();
			      if(conn!=null) conn.close();
			      dis=request.getRequestDispatcher("index.jsp");
			      dis.forward(request,response);
			  }
			  else{
				  if(rs!=null)rs.close();
				  if(pstmt!=null)pstmt.close();
				  if(conn!=null)conn.close();
				  dis=request.getRequestDispatcher("error.jsp");
				  dis.forward(request,response);
			  }
		} catch (Exception e) {
			   e.printStackTrace();
		}
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response)
	           throws ServletException,IOException {
		    doGet(request,response);
	}
}
	