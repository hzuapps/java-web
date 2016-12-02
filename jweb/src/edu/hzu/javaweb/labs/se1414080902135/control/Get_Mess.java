package control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Shop;
import util.Build;

@WebServlet(name="Get_Mess",urlPatterns="/Get_Mess")
public class Get_Mess extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		Build bu=new Build();
		ArrayList<Shop> mess=bu.GetShop();
		request.setAttribute("mess", mess);
		request.getRequestDispatcher("/shop_mess.jsp").forward(request, response);
	}
}
