package se1414080902229;

import javax.servlet.annotation.WebServlet;
import java.io.IOException;

/**
 * Created by yuan on 2016/11/7.
 */
@WebServlet(value = "/se1414080902229")
public class se1414080902229 extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
        response.getWriter().println("servlet 接受成功");
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        doPost(request,response);
    }
}
