package edu.hzu.javaweb.labs.se1414080902221;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
@WebFilter(filterName = "EncodingFilter", urlPatterns = "/*")
public class EcondingFilter implements Filter {
	 private String encoding = null;   
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		 String encoding = getEncoding();   
	        if (encoding == null){   
	             encoding = "gb2312";   
	         }   
	         request.setCharacterEncoding(encoding);// 在请求里设置上指定的编码   
	         chain.doFilter(request, response);   
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		 this.encoding = filterConfig.getInitParameter("encoding");
	}
	 private String getEncoding() {   
	        return this.encoding;   
	     }   
	  
}
