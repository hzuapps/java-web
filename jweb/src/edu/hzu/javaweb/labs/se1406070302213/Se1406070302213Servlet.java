package edu.hzu.javaweb.labs.se1406070302213;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
//import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Se1406070302213Servlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
 			throws ServletException, IOException {

		
		String pw = request.getParameter("pw");
		HttpSession session = request.getSession();
		session.setAttribute("pw", pw);
		
		List<Userinfo> userinfos = new ArrayList<Userinfo>();
		String[] name = new String[]{"∞¢¥Û","∞¢∂˛","’‘√Ù"};
		int[] age=new int[]{22,21,18};
		boolean[] sex=new boolean[]{true,true,false};
		Date date = new Date();
		Userinfo userinfo;
		for(int i = 0; i < 3; i++){
			userinfo = new Userinfo();
			userinfo.setDate(date.getYear() + "-" + date.getMonth() + "-" + date.getDay());
			userinfo.setId(i+"");			
			userinfo.setName(name[i]);
			userinfo.setAge(age[i]);
			userinfo.setSex(sex[i]);
		}
		
		request.setAttribute("userinfos", userinfos);
		request.getRequestDispatcher("/index").forward(request, response);
	}		
}
