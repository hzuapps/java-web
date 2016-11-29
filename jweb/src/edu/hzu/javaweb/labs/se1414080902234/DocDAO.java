package edu.hzu.javaweb.labs.se1414080902234;

import java.sql.*;
import java.util.*;
import edu.hzu.javaweb.labs.se1414080902234.Doc;

public class DocDAO {

	public List<Doc> allDoc(String mykw)
	{
	List<Doc> list=new ArrayList<Doc>();
	try
	{
	    
	    String driverName = "com.mysql.jdbc.Driver";
	    String userName = "root";
	    String userPwd = "root";
	    String dbName = "test";
	    String url1="jdbc:mysql://localhost:3306/"+dbName;
	    String url2="?user="+userName+"&password="+userPwd;
	    String url3="&useUnicode=true&characterEncoding=UTF-8";
	    String url=url1+url2+url3;
	    Class.forName(driverName);
	    Connection conn=DriverManager.getConnection(url);
	    String sql="select * from doc where name=?";
	    PreparedStatement pstmt=conn.prepareStatement(sql);
	    pstmt.setString(1, mykw);
	    ResultSet rs=pstmt.executeQuery();
	while(rs.next())
	{
	Doc c=new Doc();
	System.out.println("Succeed!");
	c.setDocname(rs.getString(1));
	c.setDocpath(rs.getString(2));
	list.add(c);
	}
	}
	catch(Exception ex)
	{}
	return list;
	}
	 
	
}
