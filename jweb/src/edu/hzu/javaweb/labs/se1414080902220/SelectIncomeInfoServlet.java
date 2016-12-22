package edu.hzu.javaweb.labs.se1414080902220;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns="/SelectIncomeInfo")
public class SelectIncomeInfoServlet extends HttpServlet {
	public class className {

	}

	
	public SelectIncomeInfoServlet() {
		super();
	}

	
	public void destroy() {
		super.destroy(); 
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String sqltext="select * from income";
		ResultSet rs= new SqlHelp().executeQueryRS(sqltext, null);
		List<Income> incomeList=new ArrayList<Income>();
		try {
			while (rs.next()) 
			{
				Income income=new Income();
				income.setId(rs.getInt(1));
				income.setIncomeMoney(rs.getDouble(2));
				income.setDescription(rs.getString(3));
				income.setTime(rs.getString(4));
				incomeList.add(income);
			}
		} catch (SQLException e) {
			System.out.print(e.getMessage());
		}
		request.setAttribute("queryResult", incomeList);
		request.getRequestDispatcher("/1414080902220/displayIncome.jsp").forward(request, response);

		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
	}

	
	public void init() throws ServletException {
	}
}
