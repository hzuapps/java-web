package edu.hzu.javaweb.labs.se1414080902106.myServlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import edu.hzu.javaweb.labs.se1414080902106.MyDAO;
import edu.hzu.javaweb.labs.se1414080902106.myJavaBeans.*;

@WebServlet("/register")
public class Register extends HttpServlet {
  private static final long serialVersionUID = 1L;

  public Register() {
    super();
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    HttpSession session = request.getSession();
    //获取提交的数据
    String username = (String) session.getAttribute("username");
    session.removeAttribute("username");
    String password = (String) session.getAttribute("password");
    session.removeAttribute("password");
    String name = (String) session.getAttribute("name");
    session.removeAttribute("name");
    //写入JavaBean
    Account New = new Account();
    New.setUsername(username);
    New.setPassword(password);
    New.setName(name);
    //使用DAO注册
    MyDAO<Account> dao = new MyDAO<Account>(Account.class);
    PrintWriter out = response.getWriter();
    try {
      //执行注册操作
      dao.Insert(New);
      //返回成功消息
      out.print("success");
    } catch (SQLException e) {
      //关闭原来的数据库连接
      dao.CloseDB();
      //返回错误消息
      out.print(e.getMessage());
    }
  }
}
