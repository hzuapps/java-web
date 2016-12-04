package edu.hzu.javaweb.labs.se1414080902223;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.hzu.javaweb.labs.se1414080902223.Score;

import edu.hzu.javaweb.labs.se1414080902223.ScoreDao;
@WebServlet("/Show_stu_info")
public class Show_stu_info extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public Show_stu_info() {
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

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		System.out.println("get«Î«Û≥…π¶!");
		
		String data = "";
		
		ScoreDao dao = new ScoreDao();
		
		try {
			List<Score> student = dao.findAll();
			if(student.size() == 0){
				request.getRequestDispatcher("error.jsp").forward(request, response);
			}else{
				for(int i = 0; i < student.size(); i++){
					System.out.println(student.get(i).getStuid());
					data += "<tr><td>"+student.get(i).getStuid()+"</td><td>"+student.get(i).getClassno()+"</td><td>"+student.get(i).getGrade()+"</td>";
				}
				request.getSession().setAttribute("data", data);
				request.getRequestDispatcher("show_data.jsp").forward(request, response);
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