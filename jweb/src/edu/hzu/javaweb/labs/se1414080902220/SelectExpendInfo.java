package edu.hzu.javaweb.labs.se1414080902220;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns="/SelectExpendInfo")
public class SelectExpendInfo extends HttpServlet {
	
	public SelectExpendInfo() {
		super();
	}

	public void destroy() {
		super.destroy(); 
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		ArrayList<Expend> expendInfos=new ArrayList<Expend>();
		expendInfos.add(new Expend(1,100.00,"2016年11月17日 ","购物"));
		expendInfos.add(new Expend(2,10.00,"2016年11月7日 ","午饭"));
		expendInfos.add(new Expend(3,8.00,"2016年11月2日 ","外卖"));
		expendInfos.add(new Expend(4,30.00,"2016年11月5日 ","看电影"));
		expendInfos.add(new Expend(5,100.00,"2016年11月25日 ","聚餐"));
		expendInfos.add(new Expend(6,10.00,"2016年11月11日 ","外卖"));
		request.setAttribute("expends", expendInfos);
		request.getRequestDispatcher("/1414080902220/showExpendMoney.jsp").forward(request, response);

		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
	}

	
	public void init() throws ServletException {
		
	}
}
