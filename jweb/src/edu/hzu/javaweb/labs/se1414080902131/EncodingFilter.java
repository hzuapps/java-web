package se1414080902131;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.logging.LogRecord;
@WebFilter(filterName="EncodingFilter",urlPattern="/*")
public class EncodingFilter implements Filter{
@Override
public void init(FilterConfig filterConfig) throws ServletException{}
@Override
public void doFilter(ServletRequest servletRequest,ServletResponse servletResponse,FilterChain filterChain)throws IOException,ServletException{
	servletRequest.setCharacterEncoding("utf=8");
	filterChain.doFilter(servletRequest, servletResponse);
	}
@Override
public void destory(){}
}
