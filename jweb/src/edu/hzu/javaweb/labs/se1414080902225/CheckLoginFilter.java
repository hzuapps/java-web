package edu.hzu.javaweb.labs.se1414080902225;

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

@WebFilter(filterName="CheckLoginFilter",urlPatterns="/1414080902225/Message.jsp")
public class CheckLoginFilter implements Filter {
	public class className {

	}

	
	@Override
	public void destroy() {
		

	}

	
	@Override
	public void doFilter(ServletRequest request, ServletResponse reponse,
			FilterChain chain) throws IOException, ServletException 
	{
		HttpServletRequest checkRequest=(HttpServletRequest)request;
		HttpServletResponse checkReponse=(HttpServletResponse)reponse;
		HttpSession mySession=checkRequest.getSession(true);
		String a=(String)mySession.getAttribute("user");
		String b=(String)mySession.getAttribute("pwd");
		String c=(String)mySession.getAttribute("role");
		if (a!=null&&b!=null)
		{
			if (c.equals("student"))
			{
				chain.doFilter(checkRequest, checkReponse);
			}
			else 
			{
				checkReponse.sendRedirect("unable.jsp");
			}
			
			
		}
		else
		{
			request.getRequestDispatcher("index.jsp").forward(checkRequest, checkReponse);
		}

	}

	
	@Override
	public void init(FilterConfig arg0) throws ServletException {
		

	}
}
