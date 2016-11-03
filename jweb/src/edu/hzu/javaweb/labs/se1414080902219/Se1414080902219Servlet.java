package edu.hzu.javaweb.labs.se1414080902219;

import java.io.IOException;
import java.io.PrintWriter;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class se1414080902219Servlet
 */
@WebServlet("/1414080902219")
public class se1414080902219Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public se1414080902219Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    public void destroy() {
    	super.destroy(); // Just puts "destroy" string in log
    	// Put your code here
   	}



	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
	    PrintWriter out=response.getWriter();
		out.print("1414080902219");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		    request.setCharacterEncoding("UTF-8");
		 	response.setContentType("text/javascript");
		 	PrintWriter out = response.getWriter();

		 	String name=request.getParameter("name");
		 	String id=request.getParameter("id");
		 	String phoneNum=request.getParameter("phoneNum");
		 	String email=request.getParameter("email");
		 	String address=request.getParameter("address");

		 	String Msg="{'name':'"+name+"','id':'"+id+"','phoneNum':'"+phoneNum+"','email':'"+email+"','address':'"+address+"'}";

		 	JSONObject data=JSONObject.fromObject(Msg);
		 	out.println(data);
	}

}
