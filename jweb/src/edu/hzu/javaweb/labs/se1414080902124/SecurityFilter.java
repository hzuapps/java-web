package com.hzu.javaweb.labs.se1414080902124;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by Administrator on 2016/11/10.
 */

@WebFilter(filterName = "SecurityFilter",urlPatterns = "/index.jsp")
public class SecurityFilter implements Filter {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse res = (HttpServletResponse) servletResponse;
        HttpSession session = req.getSession();
        //登录后才能访问
        if (session.getAttribute("username") != null) {
            filterChain.doFilter(req, res);
        } else {
            res.sendRedirect("../error.jsp");
        }
    }
}
