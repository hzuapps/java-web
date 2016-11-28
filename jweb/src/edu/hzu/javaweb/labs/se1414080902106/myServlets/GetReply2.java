package edu.hzu.javaweb.labs.se1414080902106.myServlets;

import java.io.*;
import java.sql.SQLException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import edu.hzu.javaweb.labs.se1414080902106.MyDAO;
import edu.hzu.javaweb.labs.se1414080902106.myJavaBeans.*;

@WebServlet("/getReply2")
public class GetReply2 extends HttpServlet {
  private static final long serialVersionUID = 1L;

  //负责获取、返回2级回复
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    HttpSession session = request.getSession();
    //获取数据
    int rid = Integer.parseInt((String) session.getAttribute("rid"));
    session.removeAttribute("rid");
    //组装数据
    Reply2 param = new Reply2();
    param.setRid(rid);
    //使用DAO获取2级回复
    MyDAO<Reply2> dao = new MyDAO<Reply2>(Reply2.class);
    Vector<Reply2> result = null;
    PrintWriter out = response.getWriter();
    try {
      result = dao.get(1, param);
      String s = result.toString();
      //返回2级回复
      out.print(s);
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  }
}
