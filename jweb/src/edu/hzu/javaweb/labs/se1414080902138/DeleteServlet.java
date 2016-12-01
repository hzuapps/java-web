package edu.hzu.javaweb.labs.se1414080902138;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.hzu.javaweb.labs.se1414080902138.Staff_informationDAO;
import edu.hzu.javaweb.labs.se1414080902138.Staff_information;

/**
 * Servlet implementation class DeleteServlet
 */
@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Staff_informationDAO dao = new Staff_informationDAO();		
		String id=request.getParameter("id");		
		boolean flag;
		try {
			flag = dao.deleteStaff(id);
			if(flag){
				request.getRequestDispatcher("ShowAllStaffServlet").forward(request,response);
			}else{
				 System.out.println("É¾³ýÊ§”¡!!");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}

	private void alert(String string) {
		// TODO Auto-generated method stub
		
	}
}
