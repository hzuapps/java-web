package edu.hzu.javaweb.labs.se1414080902139;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.hzu.javaweb.labs.se1414080902139.db.DbConnect;

@WebServlet("/1414080902139")
public class AddServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

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
	//@SuppressWarnings("unused")
	//定义的变量在代码中并未使用且无法访问。
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		String name=request.getParameter("name");
		if(request.getSession().getAttribute("_username")==null){
			request.setAttribute("message", "请登录再添加。<a href='login.jsp'>登录</a>");
			request.getRequestDispatcher("/message.jsp").forward(request, response);
		}
		else if("".equals(name)){
			request.setAttribute("message", "请输入姓名。<input type='button' value='返回' onclick=history.go(-1)>");
			request.getRequestDispatcher("/message.jsp").forward(request, response);
		}
		else{
			String sex=request.getParameter("sex");
			String profession=request.getParameter("profession");
			String education=request.getParameter("education");
			String tel=request.getParameter("tel");
			String email=request.getParameter("email");
			String hobby=request.getParameter("hobby");
			String experience=request.getParameter("experience");
			String skill=request.getParameter("skill");
			String honor=request.getParameter("honor");
			Connection con=null;
			PreparedStatement pstm=null;
			ResultSet rs=null;
			int n=-1;
			String sql="insert into resume(name,sex,profession,education,tel,"
					+ "email,hobby,experience,skill,honor)"+"values(?,?,?,?,?,?,?,?,?,?)";
			try {
				con=DbConnect.getDBconnection();
				pstm=con.prepareStatement(sql);
				pstm.setString(1, name);
				pstm.setString(2, sex);
				pstm.setString(3, profession);
				pstm.setString(4, education);
				pstm.setString(5, tel);
				pstm.setString(6, email);
				pstm.setString(7, hobby);
				pstm.setString(8, experience);
				pstm.setString(9, skill);
				pstm.setString(10, honor);
				n=pstm.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				DbConnect.closeDB(con, pstm, rs);
			}
			if(n==1){
				request.setAttribute("_name", name);
				request.setAttribute("_sex", sex);
				request.setAttribute("_profession", profession);
				request.setAttribute("_education", education);
				request.setAttribute("_tel", tel);
				request.setAttribute("_email", email);
				request.setAttribute("_hobby", hobby);
				request.setAttribute("_experience", experience);
				request.setAttribute("_skill", skill);
				request.setAttribute("_honor", honor);
				request.getRequestDispatcher("/show.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "姓名已经存在。<input type='button' value='返回' onclick=history.go(-1)>");
				request.getRequestDispatcher("/message.jsp").forward(request, response);
			}
		}
	}

}
