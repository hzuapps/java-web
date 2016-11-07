package edu.hzu.javaweb.labs;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

/**
 * Created by Administrator on 2016/11/7 0007.
 */
@WebFilter(filterName = "Se1414080902120EncodingFilter")
public class Se1414080902120EncodingFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        chain.doFilter(req, resp);
        req.setCharacterEncoding("UTF-8");
        chain.doFilter(req,resp);
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
