package filter;

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

@WebFilter(filterName = "second_filter" , urlPatterns = "/info.jsp")
public class second_filter implements Filter {
	

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		HttpServletResponse resp=(HttpServletResponse)response;
		
	     System.out.println("second_filter");
	     String name=request.getParameter("username").trim();
	     String pwd=request.getParameter("userpwd").trim();
	     System.out.println(name);
	     System.out.println(pwd);
	     String info=name;
	     request.setAttribute("outputMessage", info);
	    if ("abc".equals(name) &&"123".equals(pwd)) {//登录后才能访问  
	         chain.doFilter(request, response); 
	         
	     } else {   
	         resp.sendRedirect("/liao/error.jsp");   
	     }   
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub

	}

}
