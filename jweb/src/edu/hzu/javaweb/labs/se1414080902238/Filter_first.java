package edu.hzu.javaweb.labs.se1414080902238;


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

@SuppressWarnings("unused")
@WebFilter(filterName = "Filter_first", urlPatterns = "/*")


public class Filter_first implements Filter {

	@Override
	public void destroy() {}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
		FilterChain filterchain) throws IOException, ServletException {

		HttpServletRequest requ=(HttpServletRequest)request;
		HttpServletResponse resp=(HttpServletResponse)response;
		HttpSession session=requ.getSession(true);
		if(session.getAttribute("u_name")==null){
			resp.sendRedirect("login.jsp");
		}else{
			resp.sendRedirect("error.jsp");
		}
	}
	@Override
	public void init(FilterConfig arg0) throws ServletException {		// TODO Auto-generated method stub

	}

}