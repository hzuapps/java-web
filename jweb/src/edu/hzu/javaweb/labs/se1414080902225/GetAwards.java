
package edu.hzu.javaweb.labs.se1414080902225;

import java.io.IOException;
import java.io.PrintWriter;

import javax.jws.WebService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import MainController.SqlHelper;

@WebServlet(urlPatterns="/GetAwards")
public class GetAwards extends HttpServlet {
	public class className {

	}

	public GetAwards() {
		super();
	}

	
	public void destroy() {
		super.destroy(); 
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
	}

	
	@SuppressWarnings("null")
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		String awardName="Acol";
		Integer index=1;
		String sqltext2="insert into awards(AwardName,AwardTime,Rank,AwardDescription) values(?,?,?,?)";
		Integer affectLine=0;
		while (true)
		{
			Integer j=1;
			String awards[]=new String[4];
			int count=0;
			try 
			{
				for(int i=0;i<4;i++)
				{
					
					String temp=request.getParameter(awardName+index.toString()+j.toString());
					if (temp!=null&&!(temp.equals(""))) 
					{
						awards[i]=temp;
						j++;
						System.out.print(awards[i]);
					}
					else
					{
						count++;
					}
				}
				
				
			} catch (Exception e) {
				System.out.print(e.getMessage());
			}
			if (count==4) 
			{
				break;
			}
			affectLine+=new SqlHelper().executeUpdate(sqltext2, awards);
			index++;
		}
		if (affectLine>0) 
		{
			System.out.println("插入"+affectLine.toString()+"条记录");
		}
		response.sendRedirect("1414080902225/AssessmentInfo.jsp");
		
		
	}

	
	public void init() throws ServletException {
		
	}
}
