package Controller_Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Bean.Student;
import dao.StudentDao;
@WebServlet("/FindServlet")
public class FindServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		StudentDao stuDao = new StudentDao();
		int sno = Integer.parseInt(request.getParameter("sno"));
        Student stu = new Student();
		stu.setSno(sno);
		try {
			stu = stuDao.find(stu);
			int sno1 = stu.getSno();
			String name1 = stu.getName();
			String sex1 = stu.getSex();
			int age1 = stu.getAge();
			double hight1 = stu.getHight();
			double weight1 = stu.getWeight();
			double longRun1 = stu.getLongRun();
			double shortRun2 = stu.getShortRun();
			int pulmonary1 = stu.getPulmonary();
			request.setAttribute("sno", sno1);
			request.setAttribute("name", name1);
			request.setAttribute("sex", sex1);
			request.setAttribute("age", age1);
			request.setAttribute("hight", hight1);
			request.setAttribute("weight", weight1);
			request.setAttribute("longRun", longRun1);
			request.setAttribute("shortRun", shortRun2);
			request.setAttribute("pulmonary", pulmonary1);
			request.getRequestDispatcher("findResult.jsp").forward(request,
					response);
		} catch (Exception e) {
			request.setAttribute("message", "查询失败，不存在该学号的记录！");
			request.getRequestDispatcher("message").forward(request, response );
			e.printStackTrace();
		}

	}

}
