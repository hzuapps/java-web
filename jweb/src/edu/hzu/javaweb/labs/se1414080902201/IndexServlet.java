package edu.hzu.javaweb.labs.se1414080902201;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class IndexServlet
 */
@WebServlet(name="IndexServlet",urlPatterns="/index")
public class IndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IndexServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Cookie cookie = null;
    	Cookie[] cookies = null;
    	// 获取与该域相关的 Cookie 的数组
    	cookies = request.getCookies();

        if(cookies != null ){
          for (int i = 0; i < cookies.length; i++){
             cookie = cookies[i];
             if((cookie.getName()).equals("email")){
            	 request.setAttribute("email",cookie.getValue());                                        
                 RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");   
                 dispatcher.forward(request, response);
                 return;
             }
          }
          response.sendRedirect("index.jsp");
        }else{
        	response.sendRedirect("index.jsp");
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
