package Bean;



import Bean.JDBC;
import java.sql.*;
import java.util.*;

public class checkBean {
	private String check_acc;
	private String check_name;
	private String sql;
	private boolean exit;
	private ResultSet result;
	
	public void setCheck_acc(String account)
	{
		check_acc = account;
		sql = String .format("select * from user where account='%s'",check_acc);
	}
	public void setCheck_name(String name)
	{
		check_name = name;
		sql = String.format("select * from user where name='%s'",check_name);
	}
	
	public String getCheck()
	{
		return sql;
	}
	public void Check()
	{
		JDBC jdbc = new JDBC();
		jdbc.getUrl();
		try
		{
			jdbc.getConn();
			jdbc.setstmt();
			jdbc.Query(sql);
			jdbc.getResult();
			if(jdbc.getAccount() != null || jdbc.getName() != null)
			{
				exit = true;
			}
			else
			{
				exit = false;
			}
			jdbc.getclose();
		}
		catch(Exception e)
		{
			
		}
	}
	public boolean getExit()
	{
		return exit;
	}
}
