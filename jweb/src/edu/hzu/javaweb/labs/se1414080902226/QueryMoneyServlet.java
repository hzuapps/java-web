package edu.hzu.javaweb.labs.se1414080902226;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class QueryMoneyServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		QueryMoneyService qms=new QueryMoneyService();
		List<ResultMap> l=qms.queryMoney();
		request.setAttribute("msg", "数据库表还没有建呢！");
		request.getRequestDispatcher("/querymoneyres.jsp").forward(request, response);;
	}

}
