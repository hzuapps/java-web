package edu.hzu.javaweb.labs.se1414080902106.myServlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import edu.hzu.javaweb.labs.se1414080902106.MyDAO;
import edu.hzu.javaweb.labs.se1414080902106.myJavaBeans.*;

@WebServlet("/reply1")
public class NewReply1 extends HttpServlet {
  private static final long serialVersionUID = 1L;

  //负责处理1级回复
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    HttpSession session = request.getSession();
    //获取发表回复账户的ID
    int aid = ((Account) session.getAttribute("account")).getId();
    //获取所回复的帖子的ID
    int pid = Integer.parseInt((String) session.getAttribute("pid"));
    //获取1级回复的内容
    String text = (String) session.getAttribute("text");
    session.removeAttribute("text");
    //组装新回复对象
    Reply1 item = new Reply1();
    item.setAid(aid);
    item.setPid(pid);
    item.setText(text);
    //使用DAO插入新回复
    MyDAO<Reply1> dao = new MyDAO<Reply1>(Reply1.class);
    try {
      dao.Insert(item);
    } catch (SQLException e) {
      e.printStackTrace();
    }
    //跳转回刚才的帖子页面
    response.sendRedirect("./display.jsp?id=" + pid);
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doGet(request, response);
  }
}
