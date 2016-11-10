

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;


/**
 * Servlet Filter implementation class EncodingFilter
 */
@WebFilter(filterName="EncodingFilter",urlPatterns="/*")
public class EncodingFilter implements Filter {



    /**
     * Default constructor.
     */
    public EncodingFilter() {
        // TODO Auto-generated constructor stub



    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub

	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

          System.out.println("进入Encoding过滤器");
          request.setCharacterEncoding("utf-8");// 在请求上设置上指定的编码
          response.setCharacterEncoding("utf-8");//在响应上设置上指定的编码

		  chain.doFilter(request, response);
		  System.out.println("退出Encoding过滤器");
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
