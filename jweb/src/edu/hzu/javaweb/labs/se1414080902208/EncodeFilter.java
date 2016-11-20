package edu.hzu.javaweb.labs.se1414080902208;


import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

/**
 * Servlet Filter implementation class EncodeFilter
 */
@WebFilter(filterName="EncodeFilter",urlPatterns="/*")
public class EncodeFilter implements Filter {

    public EncodeFilter() {
 
    }
 
 
 	public void destroy() {
 
 	}
 
 
 	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

		System.out.println("±àÂë¹ýÂË...");
		request.setCharacterEncoding("UTF-8");
 
         response.setContentType("text/html;charset=UTF-8");
 
 		chain.doFilter(request, response);
 	}
 
 	public void init(FilterConfig fConfig) throws ServletException {
 		System.out.println("Í³Ò»±àÂë...");
 	}
 