package edu.hzu.javaweb.labs.se1414080902125;

import java.io.IOException;
import java.util.Enumeration;

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

@WebFilter(filterName = "LoginFilter", urlPatterns = "/*")

public class LoginFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest req = (HttpServletRequest) request;   
	     HttpServletResponse res = (HttpServletResponse) response;   
	  
	     HttpSession session = req.getSession(); 
	     String url = (((HttpServletRequest) request).getRequestURI());
		    if (session.getAttribute("NAME") != null) {
		         chain.doFilter(request, response);   
		     }  else if (url.equals("/SY/Login.jsp") || url.equals("/SY/Fail.jsp")) {
		         chain.doFilter(request, response);  
		         System.out.println("Not Logined ");
		     } else {
		         res.sendRedirect("Fail.jsp"); 
		     }
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub

	}

}
