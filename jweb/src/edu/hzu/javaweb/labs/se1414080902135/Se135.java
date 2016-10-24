package edu.hzu.javaweb.labs.se1414080902135;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.Build;

public class Se135 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws 
	ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws 
	ServletException, IOException {
		String load=request.getParameter("load");
		String user=request.getParameter("id");
		String pass=request.getParameter("password");
		PrintWriter out= response.getWriter();
		Build build=new Build();

		if(load.equals("load1")){
			//登录
			if(build.query(user,pass)){
				out.println(1);
			}else{
				out.println(0);
			}
		}else if(load.equals("load2")){
			//注册
			HttpSession session=request.getSession();
			@SuppressWarnings("unchecked")
			List<String>li=(List<String>) session.getAttribute("user_id");
			
			int has=0;
			for(String str:li){
				if(str.equals(user)){
					has=1;
					break;
				}
			}
			if(has==0){
				if(build.add(user,pass)){
					out.println(1);
				}else{
					System.out.println("添加用户出错");
				}
			}else if(has==1)
			out.println(0);
		}
		out.close();
	}
}
