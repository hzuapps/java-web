package edu.hzu.javaweb.labs.se1414080902121;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

@WebFilter(filterName = "Fliter1", urlPatterns = "/*")

public class Fliter1 implements Filter {
	 	public void destroy() {
	 
	 	}
	 	public void doFilter(ServletRequest request, ServletResponse response,
	 			FilterChain chain) throws IOException, ServletException {
	 		
	 		request.setCharacterEncoding("UTF-8");
	 		response.setCharacterEncoding("UTF-8"); 
	 		chain.doFilter(request, response);
	 	}
	 	public void init(FilterConfig filterConfig) throws ServletException {
	 
	 	}
	 
	 } 

