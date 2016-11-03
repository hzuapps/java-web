package edu.hzu.javaweb.labs.se1414080902228;
 
 import java.io.IOException;
 
 import javax.servlet.Filter;
 import javax.servlet.FilterChain;
 import javax.servlet.FilterConfig;
 import javax.servlet.ServletException;
 import javax.servlet.ServletRequest;
 import javax.servlet.ServletResponse;
 import javax.servlet.annotation.WebFilter;
 @WebFilter(filterName = "EncodingFilter", urlPatterns = "/*")
 public class EncodingFilter implements Filter {
 
 	@Override
 	public void destroy() {
 	
 
 	}
 
 	@Override
 	public void doFilter(ServletRequest arg0, ServletResponse arg1,
 			FilterChain arg2) throws IOException, ServletException {
 		// TODO Auto-generated method stub
 		arg0.setCharacterEncoding("UTF-8");
 		arg1.setCharacterEncoding("UTF-8");
 		arg2.doFilter(arg0, arg1);
 	}
 
 	@Override
 	public void init(FilterConfig arg0) throws ServletException {

 
 	}
 
 }