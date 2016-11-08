package edu.hzu.javaweb.labs.se1414080902210;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletResponse;

@WebFilter(filterName="LoginFilter",urlPatterns={"Succeed.jsp","/login.jsp"})
public class LoginFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest requ =(HttpServletRequest)request;
		HttpServletResponse resp = (HttpServletResponse)response;
		HttpSession session= requ.getSession(true);
		if(session.getAttribute("usename")!="abc" && session.getAttribute("userpwd") != "123" ){
			resp.sendRedirect("loginfail.jsp");
			
		}else{
			chain.doFilter(request,response);
		}
		
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {

	}

}
