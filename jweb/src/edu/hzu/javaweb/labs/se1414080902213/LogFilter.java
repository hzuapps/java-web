package edu.hzu.javaweb.labs.se1414080902213;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
@WebFilter(filterName="LoggerFilter", urlPatterns="/servlet/index.do")
public class LoggerFilter implements Filter{
	 FilterConfig config;  
	   
	    public void destroy() {  
	        this.config = null;  
	    }  
	   
	    @SuppressWarnings("deprecation")
		public void doFilter(ServletRequest req, ServletResponse res,  
	            FilterChain chain) throws IOException, ServletException {  
	        ServletContext context = this.config.getServletContext();  
	        HttpServletRequest hreq = (HttpServletRequest) req;  
	        HttpSession session = hreq.getSession();
	        System.out.println(req.getParameter("count").toString());
	        if(session.getAttribute(req.getParameter("count").toString())!=null){
	        	chain.doFilter(req, res);
	        }else{
	        	req.getRequestDispatcher("/index.jsp");
	        }
	        try {  
	            chain.doFilter(req, res);  
	        } catch (Exception e) {  
	            e.printStackTrace();  
	        }  
	    }  
	   
	    public void init(FilterConfig config) throws ServletException {  
	        this.config = config;  
	    }
	 }  