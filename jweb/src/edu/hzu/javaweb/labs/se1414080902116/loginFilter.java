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

public class loginFilter implements Filter {

	public void destroy() {
		// TODO Auto-generated method stub

	}

	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		HttpServletRequest request = null;
// TODO Auto-generated method stub
		arg0.setCharacterEncoding("utf-8");
		arg1.setCharacterEncoding("utf-8");
		String username = arg0.getParameter("username");
		 // TODO Auto-generated method stub 
		 HttpServletRequest requ=(HttpServletRequest)request; 
		 HttpServletResponse response = null; 
		 HttpServletResponse resp=(HttpServletResponse)response; 
		 HttpSession session=requ.getSession(true); 
		 if(username == "") {resp.sendRedirect("login.jsp"); } 
		 else {FilterChain filterchain = null; 
		 filterchain.doFilter(request,response);} 

	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generatedmethod stub

	}

}
