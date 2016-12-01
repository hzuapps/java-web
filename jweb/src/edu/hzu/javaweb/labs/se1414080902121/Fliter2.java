package edu.hzu.javaweb.labs.se1414080902121;

import java.io.IOException;
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

@WebFilter(filterName = "Fliter2", urlPatterns = "/*")
public class Fliter2 implements Filter  {
	
	public void doFilter(ServletRequest request,   
        ServletResponse response,   
        FilterChain chain)   
       throws IOException, ServletException {   
    HttpServletRequest req = (HttpServletRequest) request;   
    HttpServletResponse res = (HttpServletResponse) response;   
    HttpSession session = req.getSession();   
    	if (session.getAttribute("username") != null) {
        chain.doFilter(request, response);   
    	} 
    	else {   
    			res.sendRedirect("../MyJsp.jsp");   
    		}   
	}
	public void init(FilterConfig arg0) throws ServletException {
	}
	public void destroy() {
		
	} 
}
