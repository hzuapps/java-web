package edu.hzu.javaweb.labs.se1414080902124;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by Administrator on 2016/11/29.
 */
@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        StudentDAO dao = new StudentDAO();
        HttpSession session = req.getSession(true);
        Student student = (Student) session.getAttribute("stu");
        try {
            dao.remove(student);
        } catch (Exception e) {
            e.printStackTrace();
        }
        req.getRequestDispatcher("/index.jsp").forward(req,resp);
    }
}
