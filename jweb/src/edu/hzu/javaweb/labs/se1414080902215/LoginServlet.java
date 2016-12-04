package edu.hzu.javaweb.labs.se1414080902215;
import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javabean.DBUtil;
public class LoginServlet implements javax.servlet.Servlet{
public void destroy() {

}
public ServletConfig getServletConfig() {
return null;
}
public String getServletInfo() {
return null;
}
public void init(ServletConfig arg0) throws ServletException {

}
public void doPost(HttpServletRequest request,HttpServletResponse response)
throws ServletException,IOException{
String userName = request.getParameter("username");
String password = request.getParameter("password");
DBUtil db = new DBUtil();
boolean canLogin = db.loginSuccess(userName, password);
if(canLogin){
response.sendRedirect("display.jsp");
}else{
response.sendRedirect("failure.jsp");
}
}
public void service(ServletRequest request, ServletResponse response)
throws ServletException, IOException {
HttpServletRequest rq = (HttpServletRequest)request;
HttpServletResponse rs = (HttpServletResponse) response;
doPost(rq,rs);
}

}