package edu.hzu.javaweb.labs.se1414080902226;

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
    // 项目结束时就已经进行销毁  
    public void destroy() {  
        System.out.println("end do the encoding filter!");  
        params=null;  
        encoding=null;  
    }  
    public void doFilter(ServletRequest req, ServletResponse resp,  
            FilterChain chain) throws IOException, ServletException {  
        //UtilTimerStack.push("EncodingFilter_doFilter:");
    	System.out.println(chain==null);
        req.setCharacterEncoding(encoding);  
        chain.doFilter(req, resp);        
    }  
   
    // 项目启动时就已经进行读取  
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
