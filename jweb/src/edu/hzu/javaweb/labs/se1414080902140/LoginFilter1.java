package edu.hzu.javaweb.labs.se1414080902140;
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


@WebFilter(filterName = "/1414080902140")
	public class LoginFilter1 implements Filter {
    public void destroy() {
		}
    public void doFilter(ServletRequest request, ServletResponse response,
				FilterChain chain) throws IOException, ServletException {
    	    HttpServletRequest req = (HttpServletRequest) request;
			HttpServletResponse resp = (HttpServletResponse) response;
			HttpSession session=req.getSession();
			String username=(String) session.getAttribute("username");
			String url = (((HttpServletRequest) request).getRequestURI());
            if (url.equals("/jweb/login1.jsp")) {
				chain.doFilter(req, resp);
			}
			 if (username == null) {
		          resp.sendRedirect(req.getContextPath()+"/login1.jsp");
		     }   
			 else{
		    	 chain.doFilter(req,resp);
		      }
		     
			
		}
      public void init(FilterConfig filterConfig) throws ServletException {
			}

	}

