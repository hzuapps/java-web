package edu.hzu.javaweb.labs.se1414080902220;
import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

@WebFilter(filterName="EncodingFilterSetting",urlPatterns="/1414080902220/addinfo.jsp")
public class CheckValidityFilter implements Filter {
	public class className {

	}

	public CheckValidityFilter() {
		
	}

	@Override
	public void destroy() {
		

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		try 
		{
			String account=request.getParameter("account");
			String password=request.getParameter("pwd");
			boolean checkNull=!account.equals("")&&!password.equals("");
			if (checkNull) 
			{
				RequestDispatcher rd=request.getRequestDispatcher("addinfo.jsp");
				rd.forward(request, response);
			}
			else 
			{
				RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
				rd.forward(request, response);
			}
			chain.doFilter(request, response); 
			System.out.println("调用登录检查过滤器");
		} catch (Exception e) {
			Throwable rootCause=e;
			while (rootCause.getCause()!=null)
			{
				rootCause=rootCause.getCause();
			}
			String exceptionMsg=rootCause.getMessage();
			exceptionMsg=exceptionMsg==null?"异常"+rootCause.getClass().getName():exceptionMsg;
			request.setAttribute("except", exceptionMsg);
			RequestDispatcher rd=request.getRequestDispatcher("error.jsp");
			rd.forward(request, response);
		}
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		

	}
}
