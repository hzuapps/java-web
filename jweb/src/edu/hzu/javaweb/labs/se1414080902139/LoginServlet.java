package edu.hzu.javaweb.labs.se1414080902139;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.hzu.javaweb.labs.se1414080902139.db.DbConnect;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/1414080902139")
public class LoginServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Connection con=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		String sql="select pwd from user where id=?";
		request.setCharacterEncoding("utf-8");
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String pwd=null;//using null is better than "",why?
//		it's bad that the pwd is "" if the rs inquired from database is 0 
//		and the password is not inputed
		if(!"".equals(username)){//username is not null
			try{
				con=DbConnect.getDBconnection();
				pstm=con.prepareStatement(sql);
				pstm.setString(1, username);
				rs=pstm.executeQuery();//密码
				if(rs.next())
					pwd=rs.getString(1);
			}catch(Exception e){
				//
			}finally{
				DbConnect.closeDB(con, pstm, rs);
			}
			if(pwd==null){
				request.setAttribute("message", "用户名不存在。<input type='button' value='返回' onclick=history.go(-1)>");
				request.getRequestDispatcher("/message.jsp").forward(request, response);
			}
			else{
				if(password.equals(pwd)){
	//				在这里设置session属性
					request.getSession().setAttribute("_username", username);
					request.getRequestDispatcher("/home.jsp").forward(request, response);
				}
				else{
					request.setAttribute("message", "密码错误。<input type='button' value='返回' onclick=history.go(-1)>");
					request.getRequestDispatcher("/message.jsp").forward(request, response);
				}
			}
		}
		else{//username is null
			request.setAttribute("message", "请输入用户名。<input type='button' value='返回' onclick=history.go(-1)>");
			request.getRequestDispatcher("/message.jsp").forward(request, response);
		}				
	}
	
}
