package Se1414080902117;

import java.io.IOException;
import java.io.PrintWriter;
import Bean.Bean1;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/1414080902117")
public class servlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public servlet() {
		super();
	}

	public void destroy() {
		super.destroy();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		response.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("name");
		String birthplace = request.getParameter("birthplace");
		String birthday = request.getParameter("birthday");
		String email = request.getParameter("email");
		String graduate = request.getParameter("graduate");
		String skill = request.getParameter("skill");
		String workexp = request.getParameter("workexp");
		String age = request.getParameter("age");
		String telephone = request.getParameter("telephone");
		String education_bg = request.getParameter("education_bg");
		String evaluate_1 = request.getParameter("evaluate1");
		String evaluate_2 = request.getParameter("evaluate2");
		String sex = request.getParameter("sex");
		/*
		Bean.setage(age);
		Bean.setname(name);
		Bean.setbirthplace(birthplace);
		Bean.setbirthday(birthday);
		Bean.seteducation_bg(education_bg);
		Bean.setemail(email);
		Bean.setevaluate_1(evaluate_1);
		Bean.setevaluate_2(evaluate_2);
		Bean.settelephone(telephone);
		Bean.setskill(skill);
		Bean.setsex(sex);

		out.println("<jsp:useBean class='Bean.Bean' id='worker' scope='application'>");
		out.println("<jsp:setProperty name='worker' property='*'></jsp:setProperty>");
		*/
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.println("<table align='center'><tr><td align='center'>");
		out.println("submit success");
		out.println("<br/>");
		out.println("<hr width='800'/>");
		//out.println("<a href='/javaweb/personal.jsp'>return edit</a><br>");
		out.println("</td></tr></table>");
		out.println("<table align='center'>");
		out.println("<tr><td>name:</td><td>"+name+"</td></tr>");
		out.println("<tr><td>birthplace:</td><td>"+birthplace+"</td></tr>");
		out.println("<tr><td>birthday:</td><td>"+birthday+"</td></tr>");
		out.println("<tr><td>age:</td><td>"+age+"</td></tr>");
		out.println("<tr><td>sex:</td><td>"+sex+"</td></tr>");
		out.println("<tr><td>email:</td><td>"+email+"</td></tr>");
		out.println("<tr><td>telephone:</td><td>"+telephone+"</td></tr>");
		out.println("<tr><td>graduate:</td><td>"+graduate+"</td></tr>");
		out.println("<tr><td>education_bg:</td><td>"+education_bg+"</td></tr>");
		out.println("<tr><td>evaluate_1:</td><td>"+evaluate_1+"</td></tr>");
		out.println("<tr><td>evaluate_2:</td><td>"+evaluate_2+"</td></tr>");
		out.println("<tr><td>skill:</td><td>"+skill+"</td></tr>");
		out.println("</table>");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the POST method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

	public void init() throws ServletException {

	}

}
