package Controller_Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Bean.Student;
import dao.StudentDao;
@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int sno=Integer.parseInt(request.getParameter("sno"));		
		Student stu=new Student();
		stu.setSno(sno);
		StudentDao stuDao=new StudentDao();
		
		int n;
		try {
			n = stuDao.remove(stu);
			if (n>=1) {
				request.setAttribute("message", "É¾³ý³É¹¦£¡");
				request.getRequestDispatcher("message.jsp").forward(request, response);
			}
			else {
				request.setAttribute("message", "É¾³ýÊ§°Ü£¡");
				request.getRequestDispatcher("message.jsp").forward(request, response);
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		
	}

}
