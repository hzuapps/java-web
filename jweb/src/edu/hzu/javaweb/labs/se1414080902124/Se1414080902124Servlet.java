package com.hzu.javaweb.labs.se1414080902124;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.System;


/**
 * Created by Administrator on 2016/11/6.
 */

@WebServlet(name = "Se1414080902124Servlet",urlPatterns = "/change" )
public class Se1414080902124Servlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        super.doGet(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;UTF-8");

        String name = request.getParameter("name");
        String id = request.getParameter("id");
        String info = "";
        if (name.length() >= 8 || id.length() > 13) {
            info = "你所提交的信息不合理，请重新输入";
        } else {
            info = "提交成功";
        }
        request.setAttribute("Message", info);
        request.getRequestDispatcher("/info.jsp").forward(request, response);
    }

}



