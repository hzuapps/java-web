package com.logcd.filter;
import java.io.IOException;  
import javax.servlet.Filter;  
import javax.servlet.ServletException;  
import javax.servlet.ServletRequest;  
import javax.servlet.ServletResponse;  
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
import javax.servlet.http.HttpSession;

public class SecurityFilter implements Filter {   
	  
    
  
    public void destroy() {   
  
     }   
  
    public void doFilter(ServletRequest request, ServletResponse response,   
             FilterChain chain) throws IOException, ServletException {   
    	 HttpServletRequest req = (HttpServletRequest) request;   
         HttpServletResponse res = (HttpServletResponse) response;   
      
         HttpSession session = req.getSession();   
        if (session.getAttribute("u_name") != null) {//登录后才能访问   
             chain.doFilter(request, response);   
         } else {   
             res.sendRedirect("../failure.jsp");
             }  
         
     }   
  
    public void init(FilterConfig filterConfig) throws ServletException {   
   
     }   
  
}

