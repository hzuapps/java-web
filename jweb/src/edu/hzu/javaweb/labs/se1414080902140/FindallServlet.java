package Controller_Servlet;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.StudentDao;
import Bean.Student;
@WebServlet("/FindallServlet")
public class FindallServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("1321312312");
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		StudentDao stuDao=new StudentDao();
		Student stu=new Student();
		
		try {
			
			stuDao.findAll();
			List<Student> studentlist=new ArrayList<Student>();
			
			studentlist.add(stu);
			request.setAttribute("result", studentlist);
			request.getRequestDispatcher("findAll.jsp").forward(request, response);;
		} catch (Exception e) {
			
			e.printStackTrace();
		}

		
		
		
	}

}
