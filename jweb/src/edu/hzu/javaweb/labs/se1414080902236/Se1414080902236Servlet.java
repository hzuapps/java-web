package labs;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Se1414080902236Servlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public Se1414080902236Servlet() {
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
        request.setCharacterEncoding("UTF-8");
		String Manufacturers=(String)request.getParameter("manufacturers");
		String Level=request.getParameter("level");
		String Engine=request.getParameter("engine");
		String Gearbox=request.getParameter("gearbox");
		String Size=request.getParameter("size");
		String Body=request.getParameter("body");
		String Maxspeed=request.getParameter("maxspeed");
		String Hundred=request.getParameter("hundred");
		String Gas=request.getParameter("gas");
		request.setAttribute("Manu", Manufacturers);
		request.setAttribute("Lev", Level);
		request.setAttribute("Eng", Engine);
		request.setAttribute("Gea", Gearbox);
		request.setAttribute("Siz", Size);
		request.setAttribute("Bod", Body);
		request.setAttribute("Max", Maxspeed);
		request.setAttribute("Hun", Hundred);
		request.setAttribute("Ga", Gas);
		request.getRequestDispatcher("/output.jsp").forward(request, response);
		
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
