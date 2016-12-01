package edu.hzu.javaweb.labs.se1414080902233;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter(filterName="MyFilter",urlPatterns="/1414080902233")
public class MyFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest requ=(HttpServletRequest)request;
		HttpServletResponse resp=(HttpServletResponse)response;
		Cookie cookie = null;
    	Cookie[] cookies = null;
    	// 获取与该域相关的 Cookie 的数组
    	cookies = ((HttpServletRequest) request).getCookies();
    	
		if(cookies == null){
			resp.sendRedirect("Login.jsp");
		}
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("过滤");

	}

}