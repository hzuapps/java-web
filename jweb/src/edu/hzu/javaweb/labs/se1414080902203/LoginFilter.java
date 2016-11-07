package edu.hzu.javaweb.labs.se1414080902203;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.annotation.WebFilter;

@WebFilter(filterName = "LoginFilter", urlPatterns = "/Show.jsp")

public class LoginFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
			HttpServletRequest req = (HttpServletRequest) request;
			HttpServletResponse res = (HttpServletResponse) response;
			HttpSession session = req.getSession(true);

			if(session.getAttribute("usern")==""&&session.getAttribute("passw")=="")
			{	
				res.sendRedirect("Error.jsp");
				
				System.out.println(1121);
			
			}
			else
			{
				System.out.println(111);
				chain.doFilter(request, response);
			}

	}


	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub

	}

}
