package se1414080902220Servlet;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns="/1414080902220")
public class FirstSevlet extends HttpServlet {
	
	public FirstSevlet() {
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
		String message=new String();
		try {
			Double incomeMoney=Double.parseDouble(income);
			if (incomeMoney<0) 
			{
				message="收入不允许为空";	
			}
			else 
			{
				message="添加收入成功";
			}
		} catch (Exception e) {
			message="填写的收入不合法，请返回重新填写";
			System.out.print(e.getMessage());
		}
		request.setAttribute("res", message);
		RequestDispatcher rd=request.getRequestDispatcher("1414080902220/result.jsp");
		rd.forward(request, response);
		
	}

	
	public void init() throws ServletException {
		
	}
}
