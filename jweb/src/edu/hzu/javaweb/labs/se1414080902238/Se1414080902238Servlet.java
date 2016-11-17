package edu.hzu.javaweb.labs.se1414080902238;

import java.io.IOException;
//import java.io.PrintWriter;
 
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/1414080902238")
public class Se1414080902238Servlet extends HttpServlet {

	 

	private static final long serialVersionUID = 1L;

	
	public Se1414080902238Servlet() {
		super();
	}

	
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String clientName=request.getParameter("clientName");
		String phoneNamber=request.getParameter("phoneName");
		String car=request.getParameter("cars");
		String check=request.getParameter("check");
		String info="";
		boolean hadPaid;
		if(check=="已付款")hadPaid=true;else hadPaid=false;
		if(clientName.isEmpty()||phoneNamber.isEmpty()){
			info="输入不能为空！";
		}else{
			info="客户： "+clientName+"  "+"联系电话： "+phoneNamber;
		}
		List<Client> orders=new ArrayList<Client>();
		orders.add(new Client(clientName,phoneNamber,car,hadPaid));
		orders.add(new Client("小敏","999999","福特",true));
		orders.add(new Client("小明","888888","奔驰",true));
		orders.add(new Client("小红","777777","奥迪",false));
		request.setAttribute("outputMessage",info);
		request.setAttribute("orderList", orders);
		request.getRequestDispatcher("/info.jsp").forward(request, response);
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
		
	}

	
	public void init() throws ServletException {
		// Put your code here
	}

}
