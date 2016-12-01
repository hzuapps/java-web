package edu.hzu.javaweb.labs.se1414080902222;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/1414080902222")
  public class Se1414080902222Servlet extends HttpServlet {
  

  		request.setCharacterEncoding("gb2312");
  		response.setCharacterEncoding("gb2312");
  		PrintWriter out = response.getWriter();
 
 		String Advice = new String(request.getParameter("account"));
 		
 
 
  		if (Advice.equals("")) {

 			out.println("请写点什么吧");
  		} 
  		 else boolean flat = true;
 
 			if (flat) {
 				Connection conn = null;
 				PreparedStatement stmt = null;
 		        DBBean db = new DBBean();
 				try {
 			        conn = db.getConnection();
 			        String sql = "insert into transfer values(?,?)";
 			        stmt = db.getPreparedStatement(sql);
 			        stmt.setString(1,Advice);
 			       
 			        stmt.executeUpdate();
 			        db.closeResource(conn,null,stmt);
 				} catch (SQLException e) {
 					e.printStackTrace();
 				}
 				out.println("谢谢参与");
 			}
  		}
