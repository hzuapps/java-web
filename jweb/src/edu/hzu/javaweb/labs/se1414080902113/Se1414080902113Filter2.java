package edu.hzu.javaweb.labs;

import java.io.*;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class Se1414080902113Filter2 implements Filter {
    private String FilteredIP;
	
	public void destroy() {
		// TODO Auto-generated method stub

	}

	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest requ = (HttpServletRequest)arg0; 
               HttpServletResponse resp = (HttpServletResponse)arg1; 
                HttpSession session = requuest.getSession(true); 
               if(session.getAttribute("username")==null){ 
               responsee.sendRedirect("index.jsp"); 
                }else{ 
                 arg2.doFilter(arg0,arg1); 
                 } 
		

	}
        public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub


	}



}
