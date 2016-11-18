package edu.hzu.javaweb.labs.se1414080902226;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name="InsertMoneyServlet",urlPatterns="/1414080902226")
public class InsertMoneyServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		ResultMap rm =new ResultMap();
		if(req.getParameter("money")!=null)
			rm.setMoney(Integer.valueOf(req.getParameter("money")));
		else
			System.out.println("money拿不到！！！");
		if(req.getParameter("username")!=null)
			rm.setName((String) req.getParameter("username"));
		new InsertMoneyService().insertMoney(rm);
		req.setAttribute("msg", "插入成功");
		req.getRequestDispatcher("/insertmoneyres.jsp").forward(req, resp);
	}

}
