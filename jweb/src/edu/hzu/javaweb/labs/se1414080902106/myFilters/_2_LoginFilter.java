package edu.hzu.javaweb.labs.se1414080902106.myFilters;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebFilter;

@WebFilter(filterName="loginFilter", urlPatterns="/index.jsp")
public class _2_LoginFilter implements Filter {

  public void doFilter(ServletRequest request, ServletResponse response,
      FilterChain chain) throws IOException, ServletException {
    HttpServletRequest req = (HttpServletRequest) request;
    HttpServletResponse res = (HttpServletResponse) response;
    HttpSession session = req.getSession();
    //若已经登录则直接进入home.jsp
    if (session.getAttribute("hasLogined") != null)
      res.sendRedirect("./home.jsp");
    else
      chain.doFilter(request, response);
  }

  @Override
  public void init(FilterConfig filterConfig) throws ServletException {
  }
  @Override
  public void destroy() {
  }
}
