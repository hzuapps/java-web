package train;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/TrainServlet")
public class TrainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public TrainServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException 
	{       
		    request.setCharacterEncoding("utf-8");
		    String dp = request.getParameter("despartPlace");
		    String de = request.getParameter("destination");
		    String dd = request.getParameter("despartDate");
		    String rd = request.getParameter("returnDate");
		    TrianDAO tradao = new TrianDAO();
	        try {
				List<Train> train = tradao.find(dp, de, dd, rd);
				request.setAttribute("tra", train);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    		request.getRequestDispatcher("train_ticket.jsp").forward(request, response);
	}
}
