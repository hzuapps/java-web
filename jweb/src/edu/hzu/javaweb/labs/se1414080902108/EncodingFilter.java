package edu.hzu.javaweb.labs.se1414080902108;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

/**
 * Servlet Filter implementation class EncodingFilter
 */
@WebFilter("/1414080902108")
public class EncodingFilter implements Filter {

    /**
     * Default constructor. 
     */
	private String encoding = null;   
	
	private String getEncoding() {   
        return this.encoding;   
     }   
	
    public EncodingFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		encoding = null;   
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		 String encoding = getEncoding();   
	        if (encoding == null){   
	             encoding = "UTF-8";   
	         }   
	         request.setCharacterEncoding(encoding);
	         chain.doFilter(request, response);   
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		this.encoding = fConfig.getInitParameter("encoding");   
	}

}
