package edu.hzu.javaweb.labs.se1414080902107;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Se1414080902107
 */
@WebServlet("/Se1414080902107")
public class Se1414080902107Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Se1414080902107Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType("text/html;charset=UTF-8");
		
		String name =new String(request.getParameter("name").getBytes("ISO8859-1"),"UTF-8");
		String phone =new String(request.getParameter("phone").getBytes("ISO8859-1"),"UTF-8");
		String position = new String(request.getParameter("position").getBytes("ISO8859-1"),"UTF-8");
		String description = new String(request.getParameter("description").getBytes("ISO8859-1"),"UTF-8");
		
		PrintWriter out = response.getWriter();
		
		String docType = "<!DOCTYPE html> \n";
		out.println(docType +
		    "<html>\n" +
		    "<head><meta charset=\"utf-8\"><title>确认报修信息</title></head>\n" +
		    "<body bgcolor=\"#f0f0f0\">\n" +
		    "<h1 align=\"center\">" + "报修单信息：" + "</h1>\n" +
		    "<ul>\n" +
		    "  <li><b>姓名：</b>"
		    + name + "\n" +
		    "  <li><b>电话：</b>"
		    + phone + "\n" +
		    "  <li><b>地点：</b>"
		    + position + "\n" +
		    "  <li><b>详情：</b>"
		    + description + "\n" +
		    "</ul>\n" +
		    "<div align=\"center\">"+
		    "<button type=\"submit\" >确认</button> "+
		    "<button type=\"submit\" >返回</button>"+
		    "</div>"+
		    "</body></html>");
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
