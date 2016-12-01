package edu.hzu.javaweb.labs.se1414080902106.myServlets;

import java.io.*;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import edu.hzu.javaweb.labs.se1414080902106.MyDAO;
import edu.hzu.javaweb.labs.se1414080902106.myJavaBeans.*;

@WebServlet("/removeAccount")
public class RemoveAccount extends HttpServlet {
  private static final long serialVersionUID = 1L;

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    HttpSession session = request.getSession();
    PrintWriter out = response.getWriter();
    //获取数据
    String username = (String) session.getAttribute("username");
    session.removeAttribute("username");
    String susn = ((Account) session.getAttribute("account")).getUsername();
    //判断是否是本账户的操作
    if (!susn.equals(username)) {
      out.print("无法注销其他人的账户！");
      return;
    }
    //组装数据
    Account item = new Account();
    item.setUsername(username);
    //使用DAO删除账户
    MyDAO<Account> dao = new MyDAO<Account>(Account.class);
    try {
      dao.Remove(item);
      //同时准备退出
      session.removeAttribute("account");
      session.removeAttribute("hasLogined");
      out.print("success");
    } catch (SQLException e) {
      out.print(e.getMessage());
    }
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doGet(request, response);
  }
}
