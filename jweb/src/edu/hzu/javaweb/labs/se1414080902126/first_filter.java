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

@WebFilter(filterName="first_filter",urlPatterns="/index.jsp")
public class first_filter implements Filter {

	
	private String encoding = null; 
	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		FilterChain chain1=chain;
		System.out.println("doFilter");
		String encoding = getEncoding();   
        if (encoding == null){   
             encoding = "UTF-8";   
         }   
         request.setCharacterEncoding(encoding);// 在请求里设置上指定的编码   
         chain1.doFilter(request, response);   
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		 this.encoding = filterConfig.getInitParameter("encoding"); 
	}
	
	private String getEncoding() {   
        return this.encoding;   
     }   

}
