package edu.hzu.javaweb.labs;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Administrator on 2016/10/28 0028.
 */
public class se1414080902120Servlet extends HttpServlet {
    public se1414080902120Servlet(){
        super();
    }
    public void destroy(){
        super.destroy();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName = request.getParameter("userName");
        String userPwd = request.getParameter("passWord");
        String info="";
        //if(("admin".equals(userName)&&"123456".equals(userPwd))){
            //info = "欢迎使用MyMusicPlyaer！";
           // request.setAttribute("outPutMessage",info);
            request.getRequestDispatcher("1414080902120/player.jsp").forward(request,response);
//            response.sendRedirect("/player.jsp");
       // }
        //else{
          //  info="用户或密码错误！";
         //   request.setAttribute("outPutMessage",info);
        //    request.getRequestDispatcher("/index.jsp").forward(request,response);
      //  }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
