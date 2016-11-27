package edu.hzu.javaweb.labs.se1414080902106.myFilters;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Vector;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.*;

import edu.hzu.javaweb.labs.se1414080902106.MyDAO;
import edu.hzu.javaweb.labs.se1414080902106.myJavaBeans.*;

@WebFilter(filterName="displayFilter", urlPatterns="/display.jsp")
public class _4_DisplayFilter implements Filter {

  public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
    HttpSession session = ((HttpServletRequest) request).getSession();
    //获取参数
    int id = Integer.parseInt((String) session.getAttribute("id"));
    session.removeAttribute("id");
    //使用DAO获取帖子信息
    MyDAO<Posts> dao1 = new MyDAO<Posts>(Posts.class);
    Vector<Posts> posts = null;
    Posts param1 = new Posts();
    param1.setId(id);
    try {
      posts = dao1.get(0, param1);
      session.setAttribute("posts", posts.get(0));
    } catch (SQLException e) {
      e.printStackTrace();
    }
    //获取帖子的1级回复信息
    MyDAO<Reply1> dao2 = new MyDAO<Reply1>(Reply1.class);
    Vector<Reply1> reply1 = null;
    Reply1 param2 = new Reply1();
    param2.setPid(id);
    try {
      reply1 = dao2.get(1, param2);
      session.setAttribute("reply1", reply1);
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
