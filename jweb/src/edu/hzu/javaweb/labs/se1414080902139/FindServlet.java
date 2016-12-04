package edu.hzu.javaweb.labs.se1414080902139;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.hzu.javaweb.labs.se1414080902139.bean.Resume;
import edu.hzu.javaweb.labs.se1414080902139.db.DbConnect;

public class FindServlet extends HttpServlet {

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
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		String name=request.getParameter("name");
		String profession=request.getParameter("profession");
		String education=request.getParameter("education");
		Connection con=null;
		PreparedStatement pstm=null;
		ResultSet rs= null;
		String string=null;
		List<Resume> resumelist = new ArrayList<Resume>();
		if(!"".equals(name)){//姓名不为空
			string = "name='"+name+"'";
			if(!"".equals(profession)){//专业不空
				string=string+" and profession='"+profession+"'";
				if(!"".equals(education)){//学历不空
					string=string+" and education='"+education+"'";
				}
			}
			else{//专业空
				if(!"".equals(education)){//学历不空
					string=string+" and education='"+education+"'";
				}
			}
		}
		else{//姓名空
			if(!"".equals(profession)){//专业不空
				string="profession='"+profession+"'";
				if(!"".equals(education)){//学历不空
					string=string+" and education='"+education+"'";
				}
			}
			else{//专业空
				if(!"".equals(education)){//学历不空
					string="education='"+education+"'";
				}
				else{
					//全为空
				}
			}
		}
		if(string==null){
			request.setAttribute("message", "请输入一个条件。<input type='button' value='返回' onclick=history.go(-1)>");
			request.getRequestDispatcher("/message.jsp").forward(request, response);
		}
		else{
			String sql="select * from resume where "+string;	
			try {
				con=DbConnect.getDBconnection();
				pstm=con.prepareStatement(sql);
				rs=pstm.executeQuery();
				while(rs.next()) {
					Resume resume=new Resume();
					resume.setName(rs.getString(1));
					resume.setSex(rs.getString(2));
					resume.setProfession(rs.getString(3));
					resume.setEducation(rs.getString(4));
					resume.setTel(rs.getString(5));
					resume.setEmail(rs.getString(6));
					resume.setHobby(rs.getString(7));
					resume.setExperience(rs.getString(8));
					resume.setSkill(rs.getString(9));
					resume.setHonor(rs.getString(10));
					resumelist.add(resume);
				}
			} catch (Exception e) {
				// TODO: handle exception
			}finally{
				DbConnect.closeDB(con, pstm, rs);
			}
			request.setAttribute("findresult", resumelist);
			request.getRequestDispatcher("findresult.jsp").forward(request, response);
		}
	}

}
