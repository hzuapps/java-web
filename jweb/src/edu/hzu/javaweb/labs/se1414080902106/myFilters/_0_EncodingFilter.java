package edu.hzu.javaweb.labs.se1414080902106.myFilters;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebFilter;

@WebFilter(filterName="encodingFilter", urlPatterns="/*")
public class _0_EncodingFilter implements Filter {

  public void doFilter(ServletRequest request, ServletResponse response,
      FilterChain chain) throws IOException, ServletException {
    HttpSession session = ((HttpServletRequest) request).getSession();
    Enumeration<String> pns = request.getParameterNames();
    //把从浏览器端传来的参数编码都转换成utf-8并写入session
    while (pns.hasMoreElements()) {
      String Pname = pns.nextElement();
      String param = request.getParameter(Pname);
      //Tomcat的参数传递的编码是ISO-8859-1
      String current = new String(param.getBytes("ISO-8859-1"), "utf-8");
      session.setAttribute(Pname, current);
    }
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");
    chain.doFilter(request, response);
  }

  @Override
  public void init(FilterConfig arg0) throws ServletException {
  }
  @Override
  public void destroy() {
  }
}
