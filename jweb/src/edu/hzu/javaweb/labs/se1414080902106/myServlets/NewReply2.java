package edu.hzu.javaweb.labs.se1414080902106.myServlets;

import java.io.*;
import java.sql.SQLException;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

import edu.hzu.javaweb.labs.se1414080902106.MyDAO;
import edu.hzu.javaweb.labs.se1414080902106.myJavaBeans.*;

@WebServlet("/reply2")
public class NewReply2 extends HttpServlet implements Servlet {
  private static final long serialVersionUID = 1L;

  //负责处理2级回复
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    HttpSession session = request.getSession();
    //获取数据
    int aid = ((Account) session.getAttribute("account")).getId();
    int rid = Integer.parseInt((String) session.getAttribute("rid"));
    session.removeAttribute("rid");
    String text = (String) session.getAttribute("text");
    session.removeAttribute("text");
    //组装数据
    Reply2 item = new Reply2();
    item.setAid(aid);
    item.setRid(rid);
    item.setText(text);
    //使用DAO插入2级回复
    MyDAO<Reply2> dao = new MyDAO<Reply2>(Reply2.class);
    try {
      dao.Insert(item);
    } catch (SQLException e) {
      e.printStackTrace();
    }
    //返回结果
    PrintWriter out = response.getWriter();
    out.print("success");
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doGet(request, response);
  }
}
