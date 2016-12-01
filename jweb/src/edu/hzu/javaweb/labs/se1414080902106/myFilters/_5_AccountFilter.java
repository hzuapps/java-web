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

@WebFilter("/account.jsp")
public class _5_AccountFilter implements Filter {

  public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
    HttpSession session = ((HttpServletRequest) request).getSession();
    //获取参数
    int id = Integer.parseInt((String) session.getAttribute("id"));
    session.removeAttribute("id");
    //组装数据
    Account param1 = new Account();
    param1.setId(id);
    Posts param2 = new Posts();
    param2.setAid(id);
    //使用DAO获取账户信息
    MyDAO<Account> dao1 = new MyDAO<Account>(Account.class);
    Vector<Account> result1 = null;
    try {
      result1 = dao1.get(1, param1);
      result1.get(0).setId(id);
      session.setAttribute("other", result1.get(0));
    } catch (SQLException e1) {
      e1.printStackTrace();
    }
    //使用DAO获取账户发表的帖子
    MyDAO<Posts> dao2 = new MyDAO<Posts>(Posts.class);
    Vector<Posts> result2 = null;
    try {
      result2 = dao2.get(2, param2);
      session.setAttribute("posts", result2);
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
