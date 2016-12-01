package edu.hzu.javaweb.labs.se1414080902139;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.hzu.javaweb.labs.se1414080902139.bean.Resume;

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

		response.setCharacterEncoding("utf-8");
		List<Resume> resumelist = new ArrayList<Resume>();
		resumelist.add(new Resume("小黄","男","软件工程","大学本科","","","","","擅长Java",""));
		resumelist.add(new Resume("小白","男","信息工程","","","","","","擅长C++和C#","三好学生"));
		request.setAttribute("findresult", resumelist);
		request.getRequestDispatcher("findresult.jsp").forward(request, response);
	}

}
