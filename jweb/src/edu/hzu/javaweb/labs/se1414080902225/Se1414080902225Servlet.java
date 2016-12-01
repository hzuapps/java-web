package edu.hzu.javaweb.labs.se1414080902225;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

import javax.json.JsonObject;
import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.*;



@WebServlet("/1414080902225")
public class Se1414080902225Servlet extends HttpServlet {

	
	public Se1414080902225Servlet() {
		super();
	}

	
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		out.print("success");
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/javascript");
		PrintWriter out = response.getWriter();
		
		//String line=readJSONString(request);
		/*
		JSONObject jon=JSONObject.fromObject();
		System.out.println(jon.get("grade1"));
		*/
		String s1=request.getParameter("离散数学");
		String s2=request.getParameter("汇编语言");
		String s3=request.getParameter("大学英语4");
		String s4=request.getParameter("公共体育4");
		String s5=request.getParameter("数据库系统概论");
		String s6=request.getParameter("计算机组成原理");
		String s7=request.getParameter("马克思主义基本原理");
		String s8=request.getParameter("数据库系统课程设计");
		
		try 
		{
			double sorce[];
			sorce= new double[8];
			int i=0;
			
			sorce[i++]=Double.parseDouble(s1);
			sorce[i++]=Double.parseDouble(s2);
			sorce[i++]=Double.parseDouble(s3);
			sorce[i++]=Double.parseDouble(s4);
			sorce[i++]=Double.parseDouble(s5);
			sorce[i++]=Double.parseDouble(s6);
			sorce[i++]=Double.parseDouble(s7);
			sorce[i]  =Double.parseDouble(s8);
			for (int j = 0; j < sorce.length; j++)
			{
				System.out.println(sorce[j]);	
			}
			
			int flag=0;
			for (double d : sorce) 
			{
				if (d>=0&&d<=100) 
				{
					flag++;
				} 
			}
			if (flag==sorce.length) 
			{
				String msg="{'result':'success'}";
				JSONObject success=JSONObject.fromObject(msg);
				System.out.println(success.toString());
				out.println(success);
			}
			else
			{
				String error="{'result':'error'}";
				JSONObject errorMsg=JSONObject.fromObject(error);
				System.out.println(errorMsg.toString());
				out.print(errorMsg);
			}
			
			
			
		} catch (Exception e) 
		{
			StringBuffer excepString=new StringBuffer();
			excepString.append("{'result':'");
			excepString.append(e.toString());
			excepString.append("'}");
			JSONObject errorMsg=JSONObject.fromObject(excepString.toString());
			System.out.println(excepString.toString());
			out.print(errorMsg);
			System.out.print(e.toString());
		}
		
		
		

		
	}

	
	public void init() throws ServletException {
		
	}
	
	
	public String readJSONString(HttpServletRequest request)
	{
		   StringBuffer json = new StringBuffer();
		   String line = null;
		   try 
		   {
			   BufferedReader reader = request.getReader();
			   while((line = reader.readLine()) != null) 
			   {
				   json.append(line);
			   }
			   System.out.println(json.toString());
		   }
		   
		   catch(Exception e)
		   {
			   System.out.println(e.toString());
		   }
		   
		   return json.toString();
	}

}


