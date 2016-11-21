package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
//import java.util.*;
import beans.CountRate;
/**
 * Servlet implementation class CaculateRateServlet
 */
@WebServlet("/CaculateRateServlet")
public class CaculateRateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CaculateRateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    ArrayList<CountRate>billlist=new ArrayList<CountRate>();
    int i=0;
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		double money1=Double.parseDouble(request.getParameter("money1"));
		String qixian=request.getParameter("qixian");
		String repayment=request.getParameter("repayment");
		String date=request.getParameter("date");
		double rate = 0,sum;
		if(qixian!=null){
		if("1个月".equals(qixian)) rate=0;
		else if("3个月".equals(qixian)) rate=0.05;
		else if("6个月".equals(qixian)) rate=0.10;
		else if("1年".equals(qixian)) rate=0.15;
		else if("3年".equals(qixian)) rate=0.20;
		else  rate=0.25;}
		sum=money1+money1*rate;
		request.setAttribute("outmessage1", rate);
		request.setAttribute("outmessage2", sum);
		request.setAttribute("message1", money1);
		request.setAttribute("message2", qixian);
		request.setAttribute("message3", repayment);
		request.setAttribute("message4", date);
		
		i++;
		billlist.add(new CountRate( money1,  qixian,  repayment,i,date,sum,rate));
		request.setAttribute("bill",billlist);
		request.setAttribute("money1",money1);
		request.setAttribute("qixian",qixian);
		request.setAttribute("repayment",repayment);
		request.setAttribute("rate", rate);
		request.setAttribute("sum", sum);
		request.setAttribute("date", date);
		request.getRequestDispatcher("/output.jsp").forward(request,response);
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		doGet(request, response);
	}

}
