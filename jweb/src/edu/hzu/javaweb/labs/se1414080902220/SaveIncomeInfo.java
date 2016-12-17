package edu.hzu.javaweb.labs.se1414080902220;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns="/SaveIncomeInfo")
public class SaveIncomeInfo extends HttpServlet {
	public class className {

	}

	
	public SaveIncomeInfo() {
		super();
	}

	
	public void destroy() {
		super.destroy(); 
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String income=request.getParameter("income");
		String timeString=request.getParameter("time");
		String description=request.getParameter("description");
		Double incomeMoney=-1.0;
		try {
			incomeMoney=Double.parseDouble(income);
		} catch (Exception e) {
			System.out.print(e.getMessage());
			request.getRequestDispatcher("1414080902220/error.jsp").forward(request, response);
		}
		
		int res=new Income(incomeMoney,description,timeString).SaveIncomeInfo();
		if (res>0) 
		{
			request.getRequestDispatcher("/1414080902220/addinfo.jsp").forward(request, response);
		}
		else
		{
			request.getRequestDispatcher("/1414080902220/error.jsp").forward(request, response);
		}
		
		
		
	}

	
	public void init() throws ServletException 
	{
		
	}
}
