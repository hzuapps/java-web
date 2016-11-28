package edu.hzu.javaweb.labs.se1414080902106.myFilters;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Vector;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import edu.hzu.javaweb.labs.se1414080902106.MyDAO;
import edu.hzu.javaweb.labs.se1414080902106.myJavaBeans.*;

@WebFilter(filterName="homeFilter", urlPatterns="/home.jsp")
public class _3_HomeFilter implements Filter {

  public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
    HttpSession session = ((HttpServletRequest) request).getSession();
    //使用DAO获取所有帖子列表
    MyDAO<Posts> dao = new MyDAO<Posts>(Posts.class);
    Vector<Posts> result = null;
    Posts param = new Posts();
    try {
      //执行获取所有帖子的操作
      result = dao.get(1, param);
      //把结果写入session
      session.setAttribute("posts", result);
    } catch (SQLException e) {
      e.printStackTrace();
    }
    chain.doFilter(request, response);
  }

  @Override
  public void init(FilterConfig arg0) throws ServletException {
  }
  @Override
  public void destroy() {
  }
}
