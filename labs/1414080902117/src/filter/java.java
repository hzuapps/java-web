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

public class java implements Filter {

	private String encoding = null;


	public void destroy() {

	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		/*编码过滤器*/

		encoding = getEncoding();
		if(encoding == null)
		{
			encoding = "utf-8";
		}
		request.setCharacterEncoding(encoding);
		
		/*用户身份访问权限*/
		HttpServletRequest rq = (HttpServletRequest)request;
		HttpServletResponse rp = (HttpServletResponse)response;
		HttpSession session = rq.getSession();
		if(session.getAttribute("account")!="")
		{
			chain.doFilter(request, response);
		}
		else
		{ 
			rp.sendRedirect("failure.jsp");
		}
	}

	public void init(FilterConfig fConfig) throws ServletException {
		/*用于初始化网页，只能调用一次*/
		this.encoding = fConfig.getInitParameter("encoding");
	}
	public String getEncoding()
	{
		return this.encoding;
	}

}
