package se1414080902131;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.logging.LogRecord;
@WebFilter(filterName="SecurityFilter",urlPattern="/*",initParams={@WebInitParam(name="FilteredIP"value="192.168.131.1")})
/*paravalue可取多个值*/
public class SecurityFilter implements Filter{
	private String FilteredIP;
	@Override
	public void init(FilterConfig filterConfig) throws ServletException{
		FilteredIP=conf.getInitParameter("FilteredIP");
		if(FilteredIP==null)FilteredIP="";
	}
	@Override
	public void doFilter(ServletRequest servletRequest,ServletResponse servletResponse,FilterChain filterChain)throws IOException,ServletException{
		String remoteIP==request.getRemoteAddr();
		if(remoteIP.equals(FilteredIP)){
			chain.doFilter(request,response);}
		else{RequestDispatcher dispatcher=request.getRequestDispatcher("ErrorInfo.jsp");
		dispatcher.forward(request, response);}
		}
	@Override
	public void destory(){}
}
