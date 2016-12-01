package edu.hzu.javaweb.labs;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by Administrator on 2016/11/7 0007.
 */
@WebFilter(filterName = "Se141480902120LoginFilter")
public class Se1414080902120LoginFilter implements javax.servlet.Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        chain.doFilter(req, resp);
        HttpServletRequest requuest = (HttpServletRequest)req;
        HttpServletResponse responsee = (HttpServletResponse)resp;
        HttpSession session = requuest.getSession(true);
        if(session.getAttribute("userName")==null){
            responsee.sendRedirect("index.jsp");
        }else{
            chain.doFilter(req,resp);
        }
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
