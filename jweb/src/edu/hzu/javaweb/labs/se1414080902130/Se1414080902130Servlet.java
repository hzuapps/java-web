package edu.hzu.javaweb.labs.se1414080902130;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/1414080902130")
public class Se1414080902130Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Se1414080902130Servlet() {
		super();
	}

	public void init(ServletConfig config) throws ServletException {
		
	}

	public void destroy() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		    String Orgin = request.getParameter("orgin");
	        String Destination = request.getParameter("destination");
	        String Departdate = request.getParameter("departdate");
	        String Returndate = request.getParameter("returndate");
	        String Starttime = request.getParameter("starttime");
	        response.setContentType("text/html;charset=gb2312");
	        PrintWriter out = response.getWriter();
			if("".equals(Orgin))
				out.print("<script>alert('请输入出发地');history.back();</script>)");
			else if("".equals(Destination))
				out.print("<script>alert('请输入目的地');history.back();</script>");
			else if("".equals(Departdate))
				out.print("<script>alert('请输入出发日');history.back();</script>");
			else if("".equals(Returndate))
				out.print("<script>alert('请输入返程日');history.back();</script>");
			else if("".equals(Starttime))
				out.print("<script>alert('请选择出发时间');history.back();</script>");
			else
			{
				request.getRequestDispatcher("/info.jsp").forward(request, response);
			}
			
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}