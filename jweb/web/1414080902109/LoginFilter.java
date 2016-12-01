package filter;

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

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain filterchain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest requ=(HttpServletRequest)request;
		HttpServletResponse resp=(HttpServletResponse)response;
		HttpSession session=requ.getSession(true);
		if(session.getAttribute("u_name")==null){
			resp.sendRedirect("register.jsp");
		}
		else{
			
			filterchain.doFilter(requ,resp);
		}
		

	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		

	}

}
