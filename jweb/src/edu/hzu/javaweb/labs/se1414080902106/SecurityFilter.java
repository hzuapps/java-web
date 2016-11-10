package edu.hzu.javaweb.labs.se1414080902106;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebFilter;

@WebFilter(filterName="securityFilter",urlPatterns={"/home.jsp","/new_content.jsp","/display.jsp","/display.jsp*"})
public class SecurityFilter implements Filter {

	@Override
	public void destroy() {
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse res = (HttpServletResponse)response;
		HttpSession session = req.getSession();
		//若没登录则跳转到登录页面
		if(session.getAttribute("username") != null)
			chain.doFilter(request, response);
		else
			res.sendRedirect("./");
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	}

}
