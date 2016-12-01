package Controller_Servlet;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.Student;
import dao.StudentDao;

@WebServlet("/InsertServlet")
public class InsertServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	doPost(request, response);
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		        request.setCharacterEncoding("UTF-8");
		         StudentDao stuDao = new StudentDao();
		        int sno = Integer.parseInt(request.getParameter("sno"));
		        String name = request.getParameter("name");
			    String sex = request.getParameter("sex");
				int age = Integer.parseInt(request.getParameter("age"));
				double hight = Double.parseDouble(request.getParameter("hight"));
				double weight = Double.parseDouble(request.getParameter("weight"));
				int pulmonary = Integer.parseInt(request.getParameter("pulmonary"));
				double longRun = Double.parseDouble(request.getParameter("longRun"));
				double shortRun = Double.parseDouble(request.getParameter("shortRun"));
				Student s1 = new Student(sno, name, sex, age, weight, hight,
						longRun, shortRun, pulmonary);

				int n;
				try {
					n = stuDao.create(s1);
					if (n >= 1) {
						request.setAttribute("message", "提交成功！");
						request.getRequestDispatcher("message.jsp").forward(
								request, response);
					} else {
						request.setAttribute("message", "提交失败！不允许有2个学号相同的记录，请核实学生学号！！！");
						request.getRequestDispatcher("message.jsp").forward(
								request, response);
					}
				} catch (Exception e) {
					e.printStackTrace();
				}

}
}