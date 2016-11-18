package filters;

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

public class LoginFilter implements Filter {

	public void destroy() {
		// TODO Auto-generated method stub

	}

	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		HttpServletRequest request;
// TODO Auto-generated method stub
HttpServletRequest requ=(HttpServletRequest)request;
HttpServletResponse response;
HttpServletResponse resp=(HttpServletResponse)response;
HttpSession session=requ.getSession(true);
if(session.getAttribute("usenarme")=" ") {resp.sendRedirect("login.jsp"); }
else {FilterChain filterchain;
filterchain.doFilter(request,response);}
	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
