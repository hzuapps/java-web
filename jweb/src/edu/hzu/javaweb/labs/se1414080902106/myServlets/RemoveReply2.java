package edu.hzu.javaweb.labs.se1414080902106.myServlets;

import java.io.*;
import java.sql.SQLException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import edu.hzu.javaweb.labs.se1414080902106.MyDAO;
import edu.hzu.javaweb.labs.se1414080902106.myJavaBeans.*;

@WebServlet("/removeReply2")
public class RemoveReply2 extends HttpServlet {
  private static final long serialVersionUID = 1L;

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    HttpSession session = request.getSession();
    PrintWriter out = response.getWriter();
    //获取数据
    int aid = ((Account) session.getAttribute("account")).getId();
    int id = Integer.parseInt((String) session.getAttribute("id"));
    session.removeAttribute("id");
    //组装数据
    Reply2 item = new Reply2();
    item.setId(id);
    //使用DAO
    MyDAO<Reply2> dao = new MyDAO<Reply2>(Reply2.class);
    Vector<Reply2> result = null;
    try {
      //判断是否可以删帖
      result = dao.get(0, item);
      if (result.get(0).getAid() != aid) {
        out.print("无法删除非本账号的回复！");
        return;
      }
      //删除回复
      dao.Remove(item);
      out.print("success");
    } catch (SQLException e) {
      out.print(e.getMessage());
    }
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doGet(request, response);
  }
}
