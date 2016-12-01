package edu.hzu.javaweb.labs.se1414080902214;
 
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
 
 @WebFilter(filterName="FirstFilter",urlPatterns="/*")
 public class FirstFilter implements Filter {
 
	@Override
	public void destroy() {
 		// TODO Auto-generated method stub
 
 	}
//
 	@Override
 	public void doFilter(ServletRequest request, ServletResponse response,
 			FilterChain chain) throws IOException, ServletException {
 		// TODO Auto-generated method stub
 		HttpServletRequest requ=(HttpServletRequest)request;
		HttpServletResponse resp=(HttpServletResponse)response;
 		HttpSession session=requ.getSession(true);
 		if(session.getAttribute("u_name")==null){
 			resp.sendRedirect("index.jsp");
		}else{
 			resp.sendRedirect("error.jsp");
 		}
 	}
 
 	@Override
 	public void init(FilterConfig filterConfig) throws ServletException {
 		// TODO Auto-generated method stub
 
 	}
 
 }