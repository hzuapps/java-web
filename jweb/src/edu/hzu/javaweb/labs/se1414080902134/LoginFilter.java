package edu.hzu.javaweb.labs.se1414080902134;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class LoginFilter
 */
@WebFilter(filterName = "/LoginFilter",urlPatterns = "/*")
public class LoginFilter implements Filter {

    /**
     * Default constructor. 
     */
	private final String js = "/jweb/1414080902134/js";
	private final String css = "/jweb/1414080902134/css";
	private final String font = "/jweb/1414080902134/font";
	private final String img = "/jweb/1414080902134/img";
    public LoginFilter() {
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
		// TODO Auto-generated method stub
		// place your code here
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse res = (HttpServletResponse)response;
		HttpSession session = req.getSession();
		String reqURL = req.getRequestURI();
		String page;
		if (reqURL.indexOf('?') != -1) {
			page = reqURL.substring(0,reqURL.indexOf('?'));
		} else {
			page = reqURL;
		}
		//System.out.println(page);
		//System.out.println(page);
		if (session.getAttribute("login") != null) {
			chain.doFilter(request, response);
		} else if (page.equals("/jweb/1414080902134/home.jsp") 
					|| page.equals("/jweb/1414080902134")
					|| page.substring(0,js.length()).equals(js)
					|| page.substring(0,font.length()).equals(font)
					|| page.substring(0,css.length()).equals(css)
					|| page.substring(0,img.length()).equals(img)
			){
			chain.doFilter(request, response);
		} else {
			res.sendRedirect("/jweb/1414080902134/home.jsp");
		}
		// pass the request along the filter chain
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
