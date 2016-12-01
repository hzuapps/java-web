package edu.hzu.javaweb.labs.se1414080902231;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@SuppressWarnings("serial")
@WebServlet("/1414080902231")
public class Se1414080902231Servlet extends HttpServlet {

	public Se1414080902231Servlet() {
		super();
	}

	public void destroy() {
		super.destroy();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("1414080902231");
		
		String search=request.getParameter("search");

		ArrayList<Goods> listz=new ArrayList<Goods>();
		listz.add(new Goods("Ð¡Ã×","3999","a"));
		listz.add(new Goods("÷È×å","2499","b"));
		listz.add(new Goods("iphone","4888","c"));
		
		List<Goods> list=new ArrayList<Goods>();
		for(int i=0;i<listz.size();i++)
		{
			Goods c=listz.get(i);
			if(search.equals(c.getgN()))
				list.add(c);
		}


		if(list.size()!=0)
		{
			System.out.println("not null");
			HttpSession session=request.getSession(true);
			session.setAttribute("list", list);
		}
		else if(list.size()==0)
		{
			System.out.println("no");
			HttpSession session=request.getSession(true);
			session.setAttribute("list", null);
		}
			
//		else
//		{
//			response.setContentType("text/html");
//			PrintWriter out = response.getWriter();
//			out.println(0);
//		}

//		request.setAttribute("list", list);
//		request.getRequestDispatcher("index.jsp").forward(request, response);
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request,response);
	}

	public void init() throws ServletException {
	}

}