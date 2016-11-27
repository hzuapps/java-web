package edu.hzu.javaweb.labs.se1414080902106.myServlets;

import java.io.*;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import edu.hzu.javaweb.labs.se1414080902106.MyDAO;
import edu.hzu.javaweb.labs.se1414080902106.myJavaBeans.*;

@WebServlet("/newPosts")
public class NewPosts extends HttpServlet {
  private static final long serialVersionUID = 1L;

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    HttpSession session = request.getSession();
    PrintWriter out = response.getWriter();
    //获取标题、内容
    String title = (String) session.getAttribute("title");
    session.removeAttribute("title");
    String text = (String) session.getAttribute("text");
    session.removeAttribute("text");
    //获取发帖账户ID
    int aid = ((Account) session.getAttribute("account")).getId();
    //组装数据
    Posts New = new Posts();
    New.setAid(aid);
    New.setTitle(title);
    New.setText(text);
    //使用DAO写入新帖
    MyDAO<Posts> dao = new MyDAO<Posts>(Posts.class);
    try {
      dao.Insert(New);
      out.print("success");
    } catch (SQLException e) {
      out.print(e.getMessage());
    }
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doGet(request, response);
  }
}
