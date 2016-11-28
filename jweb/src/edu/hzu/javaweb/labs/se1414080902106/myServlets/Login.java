package edu.hzu.javaweb.labs.se1414080902106.myServlets;

import java.io.*;
import java.sql.SQLException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import edu.hzu.javaweb.labs.se1414080902106.*;
import edu.hzu.javaweb.labs.se1414080902106.myJavaBeans.*;;

@WebServlet("/login")
public class Login extends HttpServlet {
  private static final long serialVersionUID = 1L;

  public Login() {
    super();
  }

  public void destroy() {
    super.destroy();
  }

  //负责退出操作
  public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    HttpSession session = request.getSession();
    //获取参数
    String out = (String) session.getAttribute("out");
    session.removeAttribute("out");
    //存在参数out表示是退出请求
    if (out != null) {
      //移除已登录的标记
      session.removeAttribute("hasLogined");
      //移除登录信息
      session.removeAttribute("account");
    }
    //跳转到index.jsp
    response.sendRedirect("./");
  }

  //负责登录操作
  public void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    HttpSession session = request.getSession();
    //获取参数——用户名、密码
    String username = (String) session.getAttribute("username");
    session.removeAttribute("username");
    String password = (String) session.getAttribute("password");
    session.removeAttribute("password");

    //使用MyDAO进行检查

    //创建DAO实例
    MyDAOInterface<Account> dao = new MyDAO<Account>(Account.class);
    //获取输入数据
    Account current = new Account();
    current.setUsername(username);
    current.setPassword(password);
    //使用DAO执行检查
    Vector<Account> result;
    PrintWriter out = response.getWriter();
    try {
      result = dao.get(0, current);
      result.get(0).setUsername(username);
      //没有抛出则一定正确
      //设置标记
      session.setAttribute("hasLogined", true);
      //写入登录信息
      session.setAttribute("account", result.get(0));
      //返回成功消息
      out.print("success");
    } catch (SQLException e) {
      //关闭原来的数据库连接
      dao.CloseDB();
      //返回错误消息
      out.print(e.getMessage());
    }
  }

  public void init() throws ServletException {
  }
}
