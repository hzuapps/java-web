package edu.hzu.javaweb.labs.se1414080902225;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

@WebFilter(filterName="SetEncodingFilter",urlPatterns="/*")
public class SetEncodingFilter implements Filter {

	private String encoding = null; 
	@Override
	public void destroy() 
	{
		 encoding = null; 
	}
	
	private String getEncoding() {   
        return this.encoding;   
     }   

	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException 
	{
		if (encoding == null){   
            encoding = "UTF-8";   
        }   
        request.setCharacterEncoding(encoding);  
        chain.doFilter(request, response);   
        System.out.println("secesss to set encoding to request");
		
	}

	
	@Override
	public void init(FilterConfig arg0) throws ServletException {
		

	}
}
