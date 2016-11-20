package edu.hzu.javaweb.labs.se1414080902208;

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

/**
 * Servlet Filter implementation class LoginFilter
 */
 +@WebFilter(filterName="LoginFilter",urlPatterns="/login.jsp")
public class LoginFilter implements Filter {

   public LoginFilter() {
 
   }
	public void destroy() {
 
 	}
 	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
       HttpServletResponse resp = (HttpServletResponse) response;
       
        HttpSession session = req.getSession();
         String path=req.getContextPath();
        String basePath=req.getScheme()+"://"+req.getServerName()+":"+req.getServerPort()+path;
       String userName=(String)session.getAttribute("username");
        if (userName==null) {
       	resp.sendRedirect(basePath+"/faile.jsp");
       } else {   
        	chain.doFilter(request, response);
        }  
	}
	public void init(FilterConfig fConfig) throws ServletException {
		System.out.println("µÇÂ¼¹ýÂË...");
	}
 
 } 