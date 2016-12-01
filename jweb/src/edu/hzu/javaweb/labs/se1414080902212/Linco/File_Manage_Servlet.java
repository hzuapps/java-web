package Linco;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.DBConnect;
import javaBeen.*;
/**
 * Servlet implementation class File_Manage_Servlet
 */
@WebServlet("/File_Manage_Servlet")
public class File_Manage_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			List<File> result=findAll();
			request.setAttribute("result", result);
			request.getRequestDispatcher("File_Menage.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			response.getWriter().append("Served at: ").append(request.getContextPath());
			e.printStackTrace();
		}
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	public List<File> findAll() throws Exception {
		Connection con=null;
	    PreparedStatement prepStmt=null;
	    ResultSet rs=null;	
	    List<File> fileList = new ArrayList<File>();
	    con=DBConnect.getDBconnection();
	    prepStmt = con.prepareStatement("select * from FileTable");
        rs = prepStmt.executeQuery();
        while(rs.next()) {
        	File f2 = new File();
            f2.setId(rs.getInt(1));
            f2.setFileName(rs.getString(2));
            f2.setSize(rs.getInt(3));
            f2.setTime(rs.getString(4));
            fileList.add(f2);
        }
        DBConnect.closeDB(con, prepStmt, rs); 
        return fileList;
	}
}
