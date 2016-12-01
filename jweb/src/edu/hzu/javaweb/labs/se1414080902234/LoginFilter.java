package edu.hzu.javaweb.labs.se1414080902234;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.*;
/**
 * Servlet Filter implementation class LoginFilter
 */
@WebFilter("/Succeed.jsp")
public class LoginFilter implements Filter {

    /**
     * Default constructor. 
     */
    public LoginFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		HttpServletRequest req = (HttpServletRequest) request;   
	    HttpServletResponse res = (HttpServletResponse) response;   
	    HttpSession session = req.getSession(); 
	    String name=request.getParameter("name");
	    String pwd=request.getParameter("pwd");
	    session.setAttribute("name",name);
	    session.setAttribute("pwd",pwd);
	    System.out.println(session.getAttribute("name"));
    	System.out.println(session.getAttribute("pwd"));
	    if(session.getAttribute("name")!=""&&session.getAttribute("pwd")!="")
	    	{
	    	System.out.println("succeed");
	    	chain.doFilter(request, response);
	    	}
		// pass the request along the filter chain
	    else{
	    	res.sendRedirect("Err.jsp");
	    	
	    	}
	    }


	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
