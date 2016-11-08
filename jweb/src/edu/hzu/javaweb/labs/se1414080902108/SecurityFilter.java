package edu.hzu.javaweb.labs.se1414080902108;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class SecurityFilter
 */
@WebFilter("/1414080902108")
public class SecurityFilter implements Filter {

    /**
     * Default constructor. 
     */
    public SecurityFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;   
	    HttpServletResponse res = (HttpServletResponse) response;   
	    HttpSession session = req.getSession();
	    String servletPath = req.getServletPath();
	    String flag = (String) session.getAttribute("flag");
	    
	    if(servletPath !=null && (servletPath.equals("/sign.jsp")) || 
	    		(servletPath.equals("/index.jsp")) || (servletPath.equals("/LoginSe1414080902108")) ||
	    		(servletPath.equals("/sign_up.jsp"))){
	    	chain.doFilter(request, response);  
	    }else{
	    	if(flag != null && flag.equals("login_success")){
	    		chain.doFilter(request, response);  
	    	}else if(flag != null && flag.equals("login_error")){
	    		req.setAttribute("msg", "登录失败");
	    		req.setAttribute("return_uri", servletPath);
	    		RequestDispatcher rd = null;
	    		rd = request.getRequestDispatcher("/sign.jsp");
				rd.forward(request, response);
	    	}else{
	    		req.setAttribute("msg", "尚未登录");
	    		req.setAttribute("return_uri", servletPath);
	    		RequestDispatcher rd = null;
	    		rd = request.getRequestDispatcher("/sign.jsp");
				rd.forward(request, response);
	    	}
	    }
	    
	    	    
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
