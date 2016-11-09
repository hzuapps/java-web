package edu.hzu.javaweb.labs.se1414080902115;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;


@WebFilter(filterName="encodingFilter",urlPatterns="/*")

public class EncodingFilter implements Filter{
	private String encoding = null;   

	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		System.out.println("doFilter");
		String encoding = getEncoding(); 
        if (encoding == null){   
             encoding = "utf-8";   
         }   
        else encoding="utf-8";
       
         request.setCharacterEncoding(encoding);
         response.setContentType("text/xml;charset=utf-8");
         chain.doFilter(request, response);   
		
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("init11111");
		this.encoding = filterConfig.getInitParameter("encoding");   
	}
	private String getEncoding() {   
        return this.encoding;   
     }  
	@Override
	public void destroy() {
		System.out.println("destroy");
		
	}

}
