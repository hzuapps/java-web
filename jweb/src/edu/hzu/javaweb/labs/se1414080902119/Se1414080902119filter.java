package edu.hzu.javaweb.labs.se1414080902119;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

@WebFilter(filterName="encodingFilter",urlPatterns="/*")
public class Se1414080902119filter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String localAddr = request.getLocalAddr();
		request.setCharacterEncoding("utf-8");
		chain.doFilter(request, response);
		if("127.0.0.1".equals(localAddr))
		{
			System.out.println("本机请求");
		}
		else
		{
			System.out.println(localAddr+"请求");
		}
		
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	}

}
