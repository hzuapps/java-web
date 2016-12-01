package edu.hzu.javaweb.labs.se1414080902134;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class MockLogin
 */
@WebServlet("/MockLogin")
public class MockLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MockLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ServletContext application=this.getServletContext(); 
		application.setAttribute("message","only dear with post method .");
		response.sendRedirect("jweb/1414080902134/home.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		ServletContext application=this.getServletContext(); 
		UserData ud = new UserData();
		Enumeration<String> iter_ = (request.getParameterNames());
		HttpSession session = request.getSession();
		session.setAttribute("info", null);
		session.setAttribute("label", null);
		session.setAttribute("quickCode", null);
		while (iter_.hasMoreElements()) {
			String key = iter_.nextElement();
			ud.setAttribute(key,request.getParameter(key));
		}
		
		if (ud.getQuickCode().equals("")) {
			if (ud.isComplete()) {
				// login success
				//System.out.println("info-9");
				ArrayList<Labels> labels = new ArrayList<Labels>();
				for (int i = 0;i < mock.count;i++) {
					labels.add(mock.get("", i));
				}
				session.setAttribute("login", true);
				session.setAttribute("labels", labels);
				response.sendRedirect("/jweb/1414080902134/ShowLabels.jsp");
			} else {
				//System.out.println("info-7");
				session.setAttribute("info", "Login fail , please input username and password or quickcode.");
				response.sendRedirect("/jweb/1414080902134/home.jsp");
			}
		} else {
			//System.out.println("info-2");
			Labels labels = mock.get(ud.getQuickCode());
			session.setAttribute("label", labels);
			session.setAttribute("quickCode", ud.getQuickCode());
			response.sendRedirect("/jweb/1414080902134/home.jsp");
		}
	}

}

//temporary until issues x
class mock{
	public static int count = 7;
	public static String[] labels = 
			(
				"Monday is a nice begin for me ._" + 
				"Tuesday is a nice begin for me ._" + 
				"Wednesday is a nice begin for me ._" + 
				"Thursday is a nice begin for me ._" + 
				"Friday is a nice begin for me ._" + 
				"Saturday is a nice begin for me ._" + 
				"Sunday is a nice begin for me ._" 
			)
			.split("_");
	public static Labels get(String str){
		Date d = new Date();
		Labels label = new Labels();
		label.setTitle("{Title}:So Nice Today");
		label.setTime((1990 + d.getYear()) + "Y " + (1 + d.getMonth()) + "M " + (d.getDate()) + "D " + d.getHours() + ":" + d.getMinutes() + ":" + d.getSeconds());
		label.setContent("{Content} : Haha , Nothing I can show for you .");
		label.setOther(new Object());
		return label;
	}
	public static Labels get(String str,int n) {
		Date d = new Date();
		Labels label = new Labels();
		label.setTitle("{Title}: " + labels[n % 7].split(" ")[0]);
		label.setTime((1990 + d.getYear()) + "Y " + (1 + d.getMonth()) + "M " + (d.getDate()) + "D " + d.getHours() + ":" + d.getMinutes() + ":" + d.getSeconds());
		label.setContent("{Content} : " + labels[n % 7]);
		label.setOther(new Object());
		label.setQuickCode("" + n);
		return label;
	}
}

