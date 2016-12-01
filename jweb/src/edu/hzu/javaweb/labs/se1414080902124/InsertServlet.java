package edu.hzu.javaweb.labs.se1414080902124;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Administrator on 2016/11/28.
 */
@WebServlet("/InsertServlet")
public class InsertServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            req.setCharacterEncoding("UTF-8");
            resp.setCharacterEncoding("UTF-8");
            StudentDAO dao = new StudentDAO();
            Student student = new Student();
            student.setId(req.getParameter("id"));
            student.setName(req.getParameter("name"));
            student.setClazz(req.getParameter("clazz"));
            student.setCity(req.getParameter("city"));
            student.setSalary(req.getParameter("salary"));
            req.setAttribute("stu",student);
            req.getRequestDispatcher("/c.jsp").forward(req,resp);
        try {
            dao.insert(student);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

}
