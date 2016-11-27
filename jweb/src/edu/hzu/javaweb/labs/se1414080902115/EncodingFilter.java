package edu.hzu.javaweb.labs.se1414080902115;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import javax.servlet.annotation.WebFilter;


@WebFilter("/EncodingFilter")
public class EncodingFilter implements Filter{
	private String encoding = null; 
	public   EncodingFilter() {
		// TODO Auto-generated constructor stub
		System.out.println("EncodingFilter");
	}
	
	@Override
	public void destroy() {
		System.out.println("destroy");
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		String encoding = getEncoding();   
        if (encoding == null){   
             encoding = "utf-8";   
         }   
         request.setCharacterEncoding(encoding);// ��������������ָ���ı���   
         
		System.out.println("doFilter");
		chain.doFilter(request, response); 
		
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("initEncodingFilter");
		this.encoding = filterConfig.getInitParameter("encoding");   
	}
	private String getEncoding() {   
        return this.encoding;   
     }   

}
