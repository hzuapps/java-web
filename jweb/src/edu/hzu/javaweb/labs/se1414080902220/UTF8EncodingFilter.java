package edu.hzu.javaweb.labs.se1414080902220;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

@WebFilter(filterName="EncodingFilterSetting",urlPatterns="/*")
public class UTF8EncodingFilter implements Filter {
	
	public UTF8EncodingFilter() {
		
	}

	@Override
	public void destroy() {
		

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		String encoding = "UTF-8";
		request.setCharacterEncoding(encoding); 
		response.setCharacterEncoding(encoding);
        chain.doFilter(request, response);   
        System.out.println("成功设置请求与相应的编码为utf-8");
		

	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
	}
}
