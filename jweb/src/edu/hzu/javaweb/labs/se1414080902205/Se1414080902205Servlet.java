package edu.hzu.javaweb.labs.se1414080902205;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/1414080902205")
public class Se1414080902205Servlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public Se1414080902205Servlet() {
		super();
	}


	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

//		response.setContentType("text/html");
//		PrintWriter out = response.getWriter();
//		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
//		out.println("<HTML>");
//		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
//		out.println("  <BODY>");
//		out.print("    This is ");
//		out.print(this.getClass());
//		out.println(", using the GET method");
//		out.println("  </BODY>");
//		out.println("</HTML>");
//		out.flush();
//		out.close();
		doPost(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		request.setCharacterEncoding("gb2312");
		response.setCharacterEncoding("gb2312");
		PrintWriter out = response.getWriter();
		String Account = "";
		String Amount ="";
		if(request.getParameter("username")!=null){
//			System.out.println("fkldasjflkasjdkflas");
			Account+=new String(request.getParameter("username"));
		}
			
		if(request.getParameter("passwd")!=null)
			Amount= new String(request.getParameter("passwd"));
//		out.print(Account);
//		out.print(Amount);
		HttpSession session=request.getSession(true);
		String msg = "";
		if (Account.equals("")) {
			msg = "�˺Ų���Ϊ��";
		} else if (Amount.equals("")) {
			msg = "ת�˽���Ϊ��";
		} else {
			boolean flat = true;
			char[] str=Account.toCharArray();
			for (int i = 0;i < Account.length();i++) {
				int x = str[i] - '0';
				if (!(x >= 0 && x <= 9)) {
					msg = "��������ȷ���˺�";
					flat = false;
					break;
				}
			}
			if (flat) {
				char[] sstr =Amount.toCharArray();
				for (int i = 0;i < Amount.length();i++) {
					int x = sstr[i] - '0';
					if (!(x >= 0 && x <= 9)) {
						msg = "��������ȷ��ת�˽��";
						flat = false;
						break;
					}
				}
			}
			if (flat) msg = "ת�˳ɹ�";
		}
		System.out.println(msg);
		request.setAttribute("message", msg);
		request.getRequestDispatcher("/index.jsp").forward(request, response);
//		System.out.println("dflajskldfjads");
		session.setAttribute("message", msg);
	//	System.out.println(session.getAttribute("message").toString());
		//System.out.println("fsfsdfsd");
//		request.getSession().setAttribute("message",msg);
//		String Account = "1414080902205";
//		String Amount = "1414080902205";
//		out.println(Account);
//		out.println(Amount);
//		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
////		out.println("<HTML>");
////		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
////		out.println("  <BODY>");
////		out.print("    This is ");
////		out.print(this.getClass());
////		out.println(", using the POST method");
////		out.println("  </BODY>");
////		out.println("</HTML>");
////		out.flush();
////		out.close();
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
