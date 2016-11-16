package edu.hzu.javaweb.labs.se1414080902140;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
@WebFilter(filterName = "/1414080902140")
public class EncodingFilter implements Filter {

	
	public void destroy() {
	}

	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain)
			throws IOException, ServletException {
	     request.setCharacterEncoding("UTF-8");
	     response.setCharacterEncoding("UTF-8");
	     filterChain.doFilter(request, response);
	}
    public void init(FilterConfig afilterConfig) throws ServletException {
	}

}
