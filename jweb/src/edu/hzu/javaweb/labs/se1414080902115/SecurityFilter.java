package edu.hzu.javaweb.labs.se1414080902115;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class SecurityFilter
 */
@WebFilter(filterName="SecurityFilter",urlPatterns="/Search.jsp")
public class SecurityFilter implements Filter {

   
    public SecurityFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		System.out.println("destroy222222222");
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;   
	     HttpServletResponse res = (HttpServletResponse) response;    
	     HttpSession session = req.getSession();   
	     System.out.println("doFilter22222");
	    if (session.getAttribute("user") != null) {//登录后才能访问   
	         chain.doFilter(request, response);   
	     } else {   
	         res.sendRedirect("login.jsp");  
	    	/* PrintWriter pr=response.getWriter();
	    	 pr.print("shibai!!!!");*/
	     }  
	    
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
	
	}

}
