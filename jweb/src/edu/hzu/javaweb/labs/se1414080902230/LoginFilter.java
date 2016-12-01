package edu.hzu.javaweb.labs.se1414080902230;

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

@WebFilter(filterName="LoginFilter",urlPatterns="/Se1414080902230Servlet")
public class LoginFilter implements Filter{

	@Override
	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
			HttpServletRequest req=(HttpServletRequest) request;
			HttpServletResponse resp=(HttpServletResponse) response;
			HttpSession session=req.getSession();
			if(!session.getAttribute("username").equals("")){
				chain.doFilter(request, response);
			}else{
				resp.sendRedirect("/jweb/web/1414080902230/index.jsp");
			}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		
	}

}
