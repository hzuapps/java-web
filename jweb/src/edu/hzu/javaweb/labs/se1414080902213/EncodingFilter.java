package edu.hzu.javaweb.labs.se1414080902213;

import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
@WebFilter(filterName="EncodingFilter", urlPatterns="/*")
public class EncodingFilter implements Filter {
    private String encoding;  
    private Map<String, String> params = new HashMap<String, String>();  
    
    public void destroy() {  
        System.out.println("end do the encoding filter!");  
        params=null;  
        encoding=null;  
    }  
    public void doFilter(ServletRequest req, ServletResponse resp,  
            FilterChain chain) throws IOException, ServletException {  
    	System.out.println(chain==null);
        req.setCharacterEncoding(encoding);  
        chain.doFilter(req, resp);        
    }  
   
    public void init(FilterConfig config) throws ServletException {  
        System.out.println("begin do the encoding filter!");  
        encoding = config.getInitParameter("encoding");  
        for (Enumeration e = config.getInitParameterNames(); e  
                .hasMoreElements();) {  
            String name = (String) e.nextElement();  
            String value = config.getInitParameter(name);  
            params.put(name, value);  
        }  
    }  
 }  